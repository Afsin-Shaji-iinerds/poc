import 'dart:math';
import 'package:flutter/material.dart';

/// Rotates an image widget (e.g. a gif) using an AnimationController.
///
/// - `isPlaying`: true => animation repeats; false => animation stops (paused).
/// - `speed`: integer seconds per full revolution. Must be >= 1; values < 1 are clamped to 1.
class RotateGifWidget extends StatefulWidget {
  final String assetPath; // e.g. 'assets/rotating.gif'
  final bool isPlaying;
  final int speed; // seconds per revolution (integer)
  final double? height;
  final BoxFit fit;

  const RotateGifWidget({
    required this.assetPath,
    required this.isPlaying,
    required this.speed,
    this.height,
    this.fit = BoxFit.contain,
    Key? key,
  }) : super(key: key);

  @override
  State<RotateGifWidget> createState() => _RotateGifWidgetState();
}

class _RotateGifWidgetState extends State<RotateGifWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Helper to ensure valid speed and compute Duration
  int get _safeSpeed => widget.speed < 1 ? 1 : widget.speed;
  Duration get _duration => Duration(seconds: _safeSpeed);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration);

    if (widget.isPlaying) {
      _controller.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant RotateGifWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If speed changed, update duration and preserve running state
    if (oldWidget.speed != widget.speed) {
      final wasAnimating = _controller.isAnimating;
      _controller.duration = _duration;
      if (wasAnimating) {
        // Restart repeat with new duration
        _controller.repeat();
      }
    }

    // If play/pause flag changed, start or stop the animation
    if (oldWidget.isPlaying != widget.isPlaying) {
      if (widget.isPlaying) {
        // resume repeating from current value
        _controller.repeat();
      } else {
        // stop (pauses at current angle)
        _controller.stop(canceled: false);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) => Transform.rotate(
        angle: _controller.value * 2 * pi,
        child: child,
      ),
      child: Image.asset(
        widget.assetPath,
        height: widget.height,
        fit: widget.fit,
      ),
    );
  }
}
