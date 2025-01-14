import 'package:flutter/material.dart';

class FlowPainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;
  final Color color;

  FlowPainter({
    super.repaint,
    required this.firstValue,
    required this.secondValue,
    required this.thirdValue,
    required this.fourthValue,
    Color? color,
  }) : color = color ?? Colors.blue;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(.8)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(
        size.width * 0.4,
        size.height / secondValue,
        size.width * 0.7,
        size.height / thirdValue,
        size.width,
        size.height / fourthValue,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
