import 'package:flutter/material.dart';
import 'dart:math' as math;

//20 dots
class ShapePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = math.min(size.width / 2, size.height / 2);
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..color = const Color(0xffa0826a)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, radius, paint);

    const smallerRadius = 7.0;
    const indicatorOffset = Offset(30, 51);
    final indicatorPaint = Paint()..color = const Color(0xffa0826a);
    canvas.drawCircle(indicatorOffset, smallerRadius, indicatorPaint);

    final outerRadius = radius - 10;
    final innerRadius = radius - 17.5;
    final centerX = size.width / 2;
    final dashPaint = Paint()
      ..color = const Color(0xffa0826a)
      ..strokeWidth = 2;
    for (double i = 0; i < 360; i += 18) {
      final x1 = centerX + outerRadius * math.cos(i * math.pi / 180);
      final y1 = centerX + outerRadius * math.sin(i * math.pi / 180);
      final x2 = centerX + innerRadius * math.cos(i * math.pi / 180);
      final y2 = centerX + innerRadius * math.sin(i * math.pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashPaint);
    }

    final dialOutlineRadius = radius - 30;
    final dialOutlinePaint = Paint()
      ..color = const Color(0xffa0826a)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, dialOutlineRadius, dialOutlinePaint);

    double convertRadiusToSigma(double radius) {
      return radius * 0.57735 + 0.5;
    }

    canvas.drawPath(
        Path()..addOval(Rect.fromCircle(center: center, radius: radius - 25)),
        Paint()
          ..color = Colors.black.withAlpha(150)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 3
          ..maskFilter =
              MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(10)));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
