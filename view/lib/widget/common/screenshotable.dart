import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenshotController {
  final key = GlobalKey();

  Future<ui.Image> takeScreenshot() async {
    final boundary = key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    return image;
  }
}

class Screenshotable extends StatelessWidget {
  final Widget child;
  final ScreenshotController controller;

  const Screenshotable({
    Key? key,
    required this.child,
    required this.controller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: controller.key,
      child: child,
    );
  }
}
