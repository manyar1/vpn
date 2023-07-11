import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vpn/core/constants/colors.dart';

class CirculProgress extends CustomPainter {
  final double currentValue;

  CirculProgress(this.currentValue);

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = 21.w
      ..color = ColorStyles.borderAnimation
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 113.9.r;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = 21.w
      ..color = ColorStyles.paintedBorderAnimation
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentValue / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), pi / 2, angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
