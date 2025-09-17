import 'package:flutter/material.dart';

/// Change these to match your Figma artboard:
const num figmaDesignWidth  = 440;
const num figmaDesignHeight = 951;

extension ResponsiveExtension on num {
  /// current screen width in pixels
  double get _sw => SizeUtils.screenWidth;
  /// current screen height in pixels
  double get _sh => SizeUtils.screenHeight;

  /// design‑px → device‑px (width)
  double get w => (this * _sw) / figmaDesignWidth;

  /// design‑px → device‑px (height)
  double get h => (this * _sh) / figmaDesignHeight;

  /// fontSize scaling (you can choose width‑based or height‑based; here width)
  double get sp => (this * _sw) / figmaDesignWidth;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) =>
      double.parse(toStringAsFixed(fractionDigits));

  double isNonZero({num defaultValue = 0.0}) =>
      this > 0 ? this : defaultValue.toDouble();
}

enum DeviceType { mobile, tablet, desktop }

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

/// Wrap your app (or top‐level page) in this so `SizeUtils` is initialized
class Sizer extends StatelessWidget {

  const Sizer({required this.builder, super.key});
  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) => OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          SizeUtils.setScreenSize(constraints, orientation);
          return builder(context, orientation, SizeUtils.deviceType);
        },
      ),
    );
  }
}

/// Internal storage for sizing info
class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double screenWidth;
  static late double screenHeight;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      screenWidth  = constraints.maxWidth.isNonZero(defaultValue: figmaDesignWidth);
      screenHeight = constraints.maxHeight.isNonZero(defaultValue: figmaDesignHeight);
    } else {
      screenWidth  = constraints.maxHeight.isNonZero(defaultValue: figmaDesignWidth);
      screenHeight = constraints.maxWidth.isNonZero(defaultValue: figmaDesignHeight);
    }

    // you can add tablet breakpoints here if desired
    deviceType = DeviceType.mobile;
  }
}
