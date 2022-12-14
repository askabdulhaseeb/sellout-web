import 'package:flutter/material.dart';

import '../../functions/responsive_function.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobile,
    this.tablet,
    this.desktop,
    Key? key,
  }) : super(key: key);

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= ResponsiveFunctions.tabletMaxWidth) {
          return desktop ??
              const Center(
                child: Text('Desktop version not able yet'),
              );
        } else if (constraints.maxWidth >= ResponsiveFunctions.mobileMaxWidth) {
          return tablet ??
              const Center(
                child: Text('Tablet version not able yet'),
              );
        } else {
          return mobile;
        }
      },
    );
  }
}