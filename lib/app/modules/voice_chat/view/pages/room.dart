import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/core/theme/app_colors_new.dart';
import 'package:funds_32bj_poc/app/core/theme/app_text_styles_new.dart';
import 'package:funds_32bj_poc/app/core/utils/size_util/size_util.dart';
import 'package:funds_32bj_poc/app/modules/voice_chat/controllers/voice_chat_controller.dart';
import 'package:livekit_client/livekit_client.dart';
import '../../../../core/theme/app_colors.dart';
import '../widgets/animated_blob_visualizer.dart';
import '../widgets/controls.dart';

class RoomPage extends StatefulWidget {
  const RoomPage({super.key});

  @override
  State<RoomPage> createState() => _RoomPageState();
}

class _RoomPageState extends State<RoomPage>
    with SingleTickerProviderStateMixin {
  Room? _room;
  EventsListener<RoomEvent>? _listener;
  List<ParticipantTrack> participantTracks = [];
  bool isAgentSpeaking = false;
  String _transcribedText = '';
  VoiceChatController voiceChatController = Get.put(VoiceChatController());
  Timer? _localAudioPollTimer;
DateTime? _lastVoiceTime;
final double _voiceThreshold = 0.03; // tune: 0.02 - 0.07
final int _silenceWindowMs = 700; 
//
 late final ScrollController _transcriptScrollController;
  // Choose height as you need (using your .h size util)
  final double _transcriptBoxHeight = 240.w;


  @override
  void initState() {
    super.initState();
       _transcriptScrollController = ScrollController();

    // whenever transcriptText changes, scroll to end
    ever(voiceChatController.transcriptText, (_) => _scrollToEnd());
    _connectToRoom();
  }

    // call to scroll to the bottom of the transcript box
  void _scrollToEnd({bool animate = true}) {
    if (!mounted) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_transcriptScrollController.hasClients) return;
      final max = _transcriptScrollController.position.maxScrollExtent;
      if (animate) {
        _transcriptScrollController.animateTo(
          max,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      } else {
        _transcriptScrollController.jumpTo(max);
      }
    });
  }

  Future<void> _connectToRoom() async {
   try{ 
   // const String url = 'https://livekit.dev.healthkarma.ai/';
    //  const String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3ODg0NzM0MzMsImlzcyI6IkFQSURHRlk4WVl5a3hnVCIsIm5hbWUiOiJUZXN0IFVzZXIiLCJuYmYiOjE3NTI0NzM0MzMsInN1YiI6InRlc3QtdXNlciIsInZpZGVvIjp7InJvb20iOiJteS1maXJzdC1yb29tIiwicm9vbUpvaW4iOnRydWV9fQ.UcYcHGL4Nebl7-sPKbDZ4uHc27u5Gi3F6vo_sTCMfRs';
     const String url = 'https://livekit-mp.iinerds.com/';
      const String token ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3OTQwMDU5MjAsImlzcyI6IkFQSVJCZWJRalhZcGdDQiIsIm5hbWUiOiJUZXN0IFVzZXIiLCJuYmYiOjE3NTgwMDU5MjAsInN1YiI6InRlc3QtdXNlciIsInZpZGVvIjp7InJvb20iOiJteS1maXJzdC1yb29tIiwicm9vbUpvaW4iOnRydWV9fQ.K6oSxmLzOJ5DV7V5fhkR3OAS0d2hQweBhXHGidW6g4M';

    const roomOptions = RoomOptions(
      defaultAudioCaptureOptions: AudioCaptureOptions(autoGainControl: true),
      adaptiveStream: true,
    );

    final room = Room();
    final listener = room.createListener();

    await room.connect(url, token, roomOptions: roomOptions);
     log('Room connected (sid=${await room.getSid()})');

    setState(() {
      _room = room;
      _listener = listener;
    });

    room.addListener(_onRoomDidUpdate);
    _setupListeners();
    _sortParticipants();

    await room.localParticipant?.setMicrophoneEnabled(true);

    if (lkPlatformIs(PlatformType.android)) {
      Hardware.instance.setSpeakerphoneOn(true);
    }
   // start polling local audio level (100ms interval)
_localAudioPollTimer?.cancel();
_localAudioPollTimer = Timer.periodic(Duration(milliseconds: 100), (_) {
  final lp = _room?.localParticipant;
  if (lp == null) return;

  // audioLevel is 0..1 (LiveKit)
  final level = lp.audioLevel;
  _handleLocalAudioLevel(level, lp.isMuted);
});

    }catch (e, s) {
    log('Failed to connect: $e\n$s');
    // show a snackbar or UI error if you want
  }
  }


void _handleLocalAudioLevel(double level, bool isMuted) {
  // if mic is muted, we treat as not speaking (or run own mic analyser)
  if (isMuted) {
    voiceChatController.isUserSpeaking.value = false;
    return;
  }

  if (level >= _voiceThreshold) {
    // mark last voice timestamp
    _lastVoiceTime = DateTime.now();
    if (!voiceChatController.isUserSpeaking.value) {
      voiceChatController.isUserSpeaking.value = true;
    }
  } else {
    // check silence window
    final last = _lastVoiceTime ?? DateTime.fromMillisecondsSinceEpoch(0);
    final silence = DateTime.now().difference(last).inMilliseconds;
    if (silence > _silenceWindowMs) {
      if (voiceChatController.isUserSpeaking.value) {
        voiceChatController.isUserSpeaking.value = false;
      }
    }
  }
}

  @override
  void dispose() {
    log("calling dispose");
      _localAudioPollTimer?.cancel();
        _transcriptScrollController.dispose();
    // _room?.removeListener(_onRoomDidUpdate);
    // _listener?.dispose();
    // _room?.dispose();
    // remove listener for local updates (no async)
  _room?.removeListener(_onRoomDidUpdate);
  // do not dispose _listener/_room here — cleanup is done in RoomDisconnectedEvent

    super.dispose();
  }

  void _setupListeners() {
    _listener?..on<RoomDisconnectedEvent>((event) async{
       try {
    if (event.reason != null) {
      log('Room disconnected: reason => ${event.reason}');
    }

    // dispose listener first (await)
    await _listener?.dispose();

    // then dispose native room resources (await)
    await _room?.dispose();
  } catch (e, s) {
    log('Error cleaning up after disconnect: $e\n$s');
  } finally {
    // Only navigate after cleanup
    if (mounted) {
      Navigator.pop(context);
    }
  }
    })..on<ParticipantEvent>((_) => _sortParticipants())..on<
        TrackSubscribedEvent>((_) => _sortParticipants())..on<
        TrackUnsubscribedEvent>((_) => _sortParticipants())..on<
        ParticipantNameUpdatedEvent>((_) => _sortParticipants())..on<
        ParticipantMetadataUpdatedEvent>((_) => _sortParticipants())..on<
        RoomMetadataChangedEvent>((_) => _sortParticipants())..on<
        AudioPlaybackStatusChanged>((event) async {
      if (!(_room?.canPlaybackAudio ?? true)) {
        await _room?.startAudio();
      }
    })..on<TranscriptionEvent>((event) {
      log('TranscriptionEvent: ${event.segments.map((s)=>s.text).join()}');
      voiceChatController.transcriptText.value = event.segments.first.text;
    })..on<DataReceivedEvent>((event) {
      final message = utf8.decode(event.data);
      final from = event.participant!.identity;
      // if (from.toLowerCase().contains('agent')) {
      //   setState(() {
      //     _transcribedText = message;
      //   });
      // }
    });

    
  }

  void _onRoomDidUpdate() => _sortParticipants();

  void _sortParticipants() {
      log('AudioPlaybackStatusChanged: canPlaybackAudio=${_room?.canPlaybackAudio}');
    if (_room == null) return;
 
    final List<ParticipantTrack> tracks = _room!.remoteParticipants.values.map(
          (p) => ParticipantTrack(participant: p),
    ).toList();

    final LocalParticipant? local = _room!.localParticipant;
    if (local != null) {
      tracks.insert(0, ParticipantTrack(participant: local));
    }

    final isSpeaking = tracks.any((t) =>
    t.participant.isSpeaking &&
        t.participant.identity.toLowerCase().contains("agent"));

    tracks.sort((a, b) {
      if (a.participant.isSpeaking && !b.participant.isSpeaking) return -1;
      if (!a.participant.isSpeaking && b.participant.isSpeaking) return 1;
      return b.participant.joinedAt.compareTo(a.participant.joinedAt);
    });

    // setState(() {
    // participantTracks = tracks;
    voiceChatController.isAgentSpeaking.value = isSpeaking;
    // });
  }

  @override
  Widget build(BuildContext context) =>
      PopScope(
         canPop: false,
        child: Scaffold(
          backgroundColor: Color(0xFFFFFFFF),
          body: _room == null
              ? const Center(child: CircularProgressIndicator())
              : SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    // SizedBox(height: 250.h),
                    // if (_transcribedText.isNotEmpty)
                    SizedBox(height: 250.h),
        
        
                    SizedBox(
        
                        child: AnimatedBlobVisualizer(
                            controller: voiceChatController)),
                    //  SizedBox(height: 12.h),
                    // Instruction text
        //  voiceChatController.transcriptText.value.isNotEmpty? SizedBox() :  Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 20.0),
        // child: Text(
        //   "Hi there 👋 I’m your ChatBuddy.\nTell me your health concern,",
        //   style: AppTextStylesNew.t1Medium.copyWith(
        //     color: AppColorsNew.tertiaryColor300,
        //   ),
        //   textAlign: TextAlign.center,
        // ),
        //     ),
            const SizedBox(height: 12),
                    // Expanded(
                    //   child: ListView.builder(
                    //     itemCount: participantTracks.length,
                    //     itemBuilder: (context, index) {
                    //       final track = participantTracks[index];
                    //       final isMe = track.participant == _room!.localParticipant;
                    //       return ListTile(
                    //         title: Text(
                    //           isMe
                    //               ? 'You (${track.participant.identity})'
                    //               : track.participant.identity,
                    //         ),
                    //         subtitle: Text(
                    //           track.participant.isSpeaking ? 'Speaking...' : 'Idle',
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),

                    //
                    //

                       // a fixed-height box that auto-scrolls to the end
                SizedBox(
                  height: _transcriptBoxHeight,
                  child: Obx(() {
                    return SingleChildScrollView(
                      controller: _transcriptScrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10),
                      child: Text(
                        voiceChatController.transcriptText.value,
                        style: AppTextStylesNew.t1Regular.copyWith(
                          color: Color(0xFF212121),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }),
                ),

            //   ],
            // ),
                    // Expanded(
                    //   child: ListView(children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 22.0, vertical: 10),
                    //       child: Obx(() {
                    //         return Text(
                    //           voiceChatController.transcriptText.value,
                    //           style: AppTextStylesNew.t1Regular.copyWith(
                    //             color: Color(0xFF212121)
                    //           ),
                    //           textAlign: TextAlign.center,
                    //         );
                    //       }),
                    //     )
                    //   ],),
                    // ),
        
                  ],
        
                ),
                if (_room!.localParticipant != null)
                  SafeArea(
                    child: ControlsWidget(
                        _room!, _room!.localParticipant!),
                  ),
              ],
            ),
          ),
        ),
      );
}

class ParticipantTrack {
  final Participant participant;

  ParticipantTrack({required this.participant});
}

//
// import 'dart:async';
// import 'dart:convert';
// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
// import 'package:livekit_client/livekit_client.dart';
//
// import '../exts.dart';
// import '../utils.dart';
// import '../widgets/controls.dart';
// import '../widgets/participant.dart';
// import '../widgets/participant_info.dart';
//
// class RoomPage extends StatefulWidget {
//   final Room room;
//   final EventsListener<RoomEvent> listener;
//
//   const RoomPage(
//     this.room,
//     this.listener, {
//     super.key,
//   });
//
//   @override
//   State<StatefulWidget> createState() => _RoomPageState();
// }
//
// class _RoomPageState extends State<RoomPage> {
//   List<ParticipantTrack> participantTracks = [];
//   EventsListener<RoomEvent> get _listener => widget.listener;
//   bool get fastConnection => widget.room.engine.fastConnectOptions != null;
//   @override
//   void initState() {
//     super.initState();
//     // add callback for a `RoomEvent` as opposed to a `ParticipantEvent`
//     widget.room.addListener(_onRoomDidUpdate);
//     // add callbacks for finer grained events
//     _setUpListeners();
//     _sortParticipants();
//     WidgetsBindingCompatible.instance?.addPostFrameCallback((_) {
//       if (!fastConnection) {
//         _askPublish();
//       }
//     });
//
//     if (lkPlatformIs(PlatformType.android)) {
//       Hardware.instance.setSpeakerphoneOn(true);
//     }
//
//     if (lkPlatformIsDesktop()) {
//       onWindowShouldClose = () async {
//         unawaited(widget.room.disconnect());
//         await _listener.waitFor<RoomDisconnectedEvent>(
//             duration: const Duration(seconds: 5));
//       };
//     }
//   }
//
//   @override
//   void dispose() {
//     // always dispose listener
//     (() async {
//       widget.room.removeListener(_onRoomDidUpdate);
//       await _listener.dispose();
//       await widget.room.dispose();
//     })();
//     onWindowShouldClose = null;
//     super.dispose();
//   }
//
//   /// for more information, see [event types](https://docs.livekit.io/client/events/#events)
//   void _setUpListeners() => _listener
//     ..on<RoomDisconnectedEvent>((event) async {
//       if (event.reason != null) {
//         print('Room disconnected: reason => ${event.reason}');
//       }
//       WidgetsBindingCompatible.instance?.addPostFrameCallback(
//           (timeStamp) => Navigator.popUntil(context, (route) => route.isFirst));
//     })
//     ..on<ParticipantEvent>((event) {
//       // sort participants on many track events as noted in documentation linked above
//       _sortParticipants();
//     })
//     ..on<RoomRecordingStatusChanged>((event) {
//       context.showRecordingStatusChangedDialog(event.activeRecording);
//     })
//     ..on<RoomAttemptReconnectEvent>((event) {
//       print(
//           'Attempting to reconnect ${event.attempt}/${event.maxAttemptsRetry}, '
//           '(${event.nextRetryDelaysInMs}ms delay until next attempt)');
//     })
//     ..on<LocalTrackSubscribedEvent>((event) {
//       print('Local track subscribed: ${event.trackSid}');
//     })
//     ..on<LocalTrackPublishedEvent>((_) => _sortParticipants())
//     ..on<LocalTrackUnpublishedEvent>((_) => _sortParticipants())
//     ..on<TrackSubscribedEvent>((_) => _sortParticipants())
//     ..on<TrackUnsubscribedEvent>((_) => _sortParticipants())
//     ..on<TrackE2EEStateEvent>(_onE2EEStateEvent)
//     ..on<ParticipantNameUpdatedEvent>((event) {
//       print(
//           'Participant name updated: ${event.participant.identity}, name => ${event.name}');
//       _sortParticipants();
//     })
//     ..on<ParticipantMetadataUpdatedEvent>((event) {
//       print(
//           'Participant metadata updated: ${event.participant.identity}, metadata => ${event.metadata}');
//     })
//     ..on<RoomMetadataChangedEvent>((event) {
//       print('Room metadata changed: ${event.metadata}');
//     })
//     ..on<DataReceivedEvent>((event) {
//       String decoded = 'Failed to decode';
//       try {
//         decoded = utf8.decode(event.data);
//       } catch (err) {
//         print('Failed to decode: $err');
//       }
//       context.showDataReceivedDialog(decoded);
//     })
//     ..on<AudioPlaybackStatusChanged>((event) async {
//       if (!widget.room.canPlaybackAudio) {
//         print('Audio playback failed for iOS Safari ..........');
//         bool? yesno = await context.showPlayAudioManuallyDialog();
//         if (yesno == true) {
//           await widget.room.startAudio();
//         }
//       }
//     });
//
//   void _askPublish() async {
//     final result = await context.showPublishDialog();
//     if (result != true) return;
//     // video will fail when running in ios simulator
//     try {
//       await widget.room.localParticipant?.setCameraEnabled(true);
//     } catch (error) {
//       print('could not publish video: $error');
//       await context.showErrorDialog(error);
//     }
//     try {
//       await widget.room.localParticipant?.setMicrophoneEnabled(true);
//     } catch (error) {
//       print('could not publish audio: $error');
//       await context.showErrorDialog(error);
//     }
//   }
//
//   void _onRoomDidUpdate() {
//     _sortParticipants();
//   }
//
//   void _onE2EEStateEvent(TrackE2EEStateEvent e2eeState) {
//     print('e2ee state: $e2eeState');
//   }
//
//   void _sortParticipants() {
//     List<ParticipantTrack> userMediaTracks = [];
//     List<ParticipantTrack> screenTracks = [];
//     for (var participant in widget.room.remoteParticipants.values) {
//       for (var t in participant.videoTrackPublications) {
//         if (t.isScreenShare) {
//           screenTracks.add(ParticipantTrack(
//             participant: participant,
//             type: ParticipantTrackType.kScreenShare,
//           ));
//         } else {
//           userMediaTracks.add(ParticipantTrack(participant: participant));
//         }
//       }
//     }
//     // sort speakers for the grid
//     userMediaTracks.sort((a, b) {
//       // loudest speaker first
//       if (a.participant.isSpeaking && b.participant.isSpeaking) {
//         if (a.participant.audioLevel > b.participant.audioLevel) {
//           return -1;
//         } else {
//           return 1;
//         }
//       }
//
//       // last spoken at
//       final aSpokeAt = a.participant.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
//       final bSpokeAt = b.participant.lastSpokeAt?.millisecondsSinceEpoch ?? 0;
//
//       if (aSpokeAt != bSpokeAt) {
//         return aSpokeAt > bSpokeAt ? -1 : 1;
//       }
//
//       // video on
//       if (a.participant.hasVideo != b.participant.hasVideo) {
//         return a.participant.hasVideo ? -1 : 1;
//       }
//
//       // joinedAt
//       return a.participant.joinedAt.millisecondsSinceEpoch -
//           b.participant.joinedAt.millisecondsSinceEpoch;
//     });
//
//     final localParticipantTracks =
//         widget.room.localParticipant?.videoTrackPublications;
//     if (localParticipantTracks != null) {
//       for (var t in localParticipantTracks) {
//         if (t.isScreenShare) {
//           screenTracks.add(ParticipantTrack(
//             participant: widget.room.localParticipant!,
//             type: ParticipantTrackType.kScreenShare,
//           ));
//         } else {
//           userMediaTracks.add(
//               ParticipantTrack(participant: widget.room.localParticipant!));
//         }
//       }
//     }
//     setState(() {
//       participantTracks = [...screenTracks, ...userMediaTracks];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//         body: Stack(
//           children: [
//             Column(
//               children: [
//                 Expanded(
//                     child: participantTracks.isNotEmpty
//                         ? ParticipantWidget.widgetFor(participantTracks.first,
//                             showStatsLayer: true)
//                         : Container()),
//                 if (widget.room.localParticipant != null)
//                   SafeArea(
//                     top: false,
//                     child: ControlsWidget(
//                         widget.room, widget.room.localParticipant!),
//                   )
//               ],
//             ),
//             Positioned(
//                 left: 0,
//                 right: 0,
//                 top: 0,
//                 child: SizedBox(
//                   height: 120,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: math.max(0, participantTracks.length - 1),
//                     itemBuilder: (BuildContext context, int index) => SizedBox(
//                       width: 180,
//                       height: 120,
//                       child: ParticipantWidget.widgetFor(
//                           participantTracks[index + 1]),
//                     ),
//                   ),
//                 )),
//           ],
//         ),
//       );
// }
