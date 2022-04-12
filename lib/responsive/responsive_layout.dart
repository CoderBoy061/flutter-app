// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../utills/dimension.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget DesktopLayout;
  final Widget MobileLayout;
  const ResponsiveLayout(
      {Key? key, required this.DesktopLayout, required this.MobileLayout})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > webScreenSize) {
          // return web screen layout if the width is more than 600
          return DesktopLayout;
        } else {
          // return mobile screen layout if the width is more than 600
          return MobileLayout;
        }
      },
    );
  }
}
