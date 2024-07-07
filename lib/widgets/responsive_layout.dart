import 'package:bilow_app/extensions/extensions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobile,
    this.tablet,
    this.desktop,
    super.key,
  });

  final Widget Function(BuildContext, Orientation) mobile;
  final Widget Function(BuildContext, Orientation)? tablet;
  final Widget Function(BuildContext, Orientation)? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const mobileWidth = 480;
        const tabletWidth = 800;
        final orientation = context.media.orientation;
        final mobileWidget = mobile.call(context, orientation);
        final tabletWidget = tablet?.call(context, orientation);

        if (constraints.maxWidth < mobileWidth) {
          return mobileWidget;
        } else if (constraints.maxWidth < tabletWidth) {
          return tabletWidget ?? mobileWidget;
        } else {
          return desktop?.call(context, orientation) ??
              tabletWidget ??
              mobileWidget;
        }
      },
    );
  }
}
