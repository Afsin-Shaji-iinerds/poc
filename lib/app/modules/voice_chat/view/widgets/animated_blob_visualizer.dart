import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:funds_32bj_poc/app/common/const/assets_const/gif_const.dart';

import '../../controllers/voice_chat_controller.dart';

class AnimatedBlobVisualizer extends StatefulWidget {
  const AnimatedBlobVisualizer({required this.controller, super.key});

  final VoiceChatController controller;

  @override
  State<AnimatedBlobVisualizer> createState() => _AnimatedBlobVisualizerState();
}

class _AnimatedBlobVisualizerState extends State<AnimatedBlobVisualizer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  double _audioLevel = 0.1; // base level for idle animation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(

        child: Obx(() {
          print("isAgentSpeaking - ${widget.controller.isAgentSpeaking.value} ${widget.controller.transcriptText.value}");
          // final int targetLevel = widget.controller.isAgentSpeaking.value
          //     ? 9
          //     : 0;
          return widget.controller.isAgentSpeaking.value
              ? Image.asset(
            GifConst.speaking,
            gaplessPlayback: true, // ensures smoother transition
            fit: BoxFit.contain,
          )
              : Image.asset(
            GifConst.notSpeaking,

            fit: BoxFit.contain,
          );
          // return AnimatedBuilder(
          //   animation: _controller,
          //   builder: (_, __) {
          //     // Smoothly transition _audioLevel per frame
          //
          //     _audioLevel += (targetLevel - _audioLevel) * 0.05;
          //
          //     return CustomPaint(
          //       painter: BlobPainter(_controller.value, _audioLevel),
          //       size: const Size(240, 240),
          //       isComplex: true,
          //       willChange: true,
          //     );
          //   },
          // );
        }),
      ),
    );
  }
}

class BlobPainter extends CustomPainter {

  BlobPainter(this.progress, this.audioLevel);

  final double progress;
  final double audioLevel;

  @override
  void paint(Canvas canvas, Size size) {
    final Offset center = size.center(Offset.zero);
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.3;

    const int ringCount = 11;
    const double baseRadius = 60;
    const double gap = 0;
    const int steps = 40;
    final double loopedTime = progress * 6 * pi;

    for (int i = 0; i < ringCount; i++) {
      final double radius = baseRadius + i * gap;
      final double amplitude = i * 2.5 + 1 * 3.0;

      final List<Offset> points = [];
      final double phaseShift = i * (2 * pi / ringCount);
      final double rotationOffset = loopedTime * 0.5;

      for (int j = 0; j < steps; j++) {
        final double angle = (j / steps) * 2 * pi;

        final double noise = sin(angle * 2 + loopedTime + phaseShift) *
            cos(angle * 3 + loopedTime + phaseShift);
        final double pull = sin(loopedTime + angle + phaseShift) * amplitude *
            noise;

        final double r = radius + pull;
        final double x = center.dx + r * cos(angle + rotationOffset);
        final double y = center.dy + r * sin(angle + rotationOffset);
        points.add(Offset(x, y));
      }

      final path = drawSmoothPath(points);

      final double t = i / ringCount;
      paint.color = Color.lerp(Colors.purple, Colors.blue, t)!
          .withOpacity(0.85 - t * 0.55);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant BlobPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.audioLevel != audioLevel;
}

Path drawSmoothPath(List<Offset> points) {
  final path = Path();
  if (points.length < 3) return path;

  for (int i = 0; i < points.length; i++) {
    Offset p0 = points[(i - 1 + points.length) % points.length];
    Offset p1 = points[i];
    Offset p2 = points[(i + 1) % points.length];
    Offset p3 = points[(i + 2) % points.length];

    if (i == 0) {
      path.moveTo(p1.dx, p1.dy);
    }

    const double t = 0.5;
    final Offset cp1 = Offset(
      p1.dx + (p2.dx - p0.dx) * t / 6,
      p1.dy + (p2.dy - p0.dy) * t / 6,
    );
    final Offset cp2 = Offset(
      p2.dx - (p3.dx - p1.dx) * t / 6,
      p2.dy - (p3.dy - p1.dy) * t / 6,
    );

    path.cubicTo(cp1.dx, cp1.dy, cp2.dx, cp2.dy, p2.dx, p2.dy);
  }

  path.close();
  return path;
}
