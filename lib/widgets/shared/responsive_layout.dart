import 'package:bilow_app/widgets/shared/orientation_layout.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobile,
    this.tablet,
    this.desktop,
    super.key,
  });

  final OrientationLayout mobile;
  final OrientationLayout? tablet;
  final OrientationLayout? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const mobileWidth = 480;
        const tabletWidth = 800;

        if (constraints.maxWidth < mobileWidth) {
          return mobile;
        } else if (constraints.maxWidth < tabletWidth) {
          return tablet ?? mobile;
        } else {
          return desktop ?? tablet ?? mobile;
        }
      },
    );
  }
}
