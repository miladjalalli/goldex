import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'generic_point.dart';

class DottedBackgroundPainter extends CustomPainter {
  DottedBackgroundPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final points = generatePoints(size: Size(400, 800), count: 100); // Generate 100 points

    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withOpacity(0.6),
          Colors.white.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height / 2));

    for (final point in points) {
      canvas.drawCircle(point, 2.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
