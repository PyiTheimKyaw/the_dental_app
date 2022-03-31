import 'dart:math';

import 'package:flutter/material.dart';

class CustomClock extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var outerCircle = Paint()
      ..strokeWidth = 2.0
      ..color = const Color.fromARGB(255, 11, 128, 224)
      ..style = PaintingStyle.fill;

    var outerSecondCircle = Paint()
      ..strokeWidth = 2.0
      ..color = const Color.fromRGBO(45, 96, 183, 1)
      ..style = PaintingStyle.fill;

    // var dottedCircle = Paint()
    //   ..strokeWidth = 2.0
    //   ..color = const Color.fromARGB(255, 161, 158, 158)
    //   ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Paint paint = Paint()..color = Colors.white;
    final double filledCircleRadius = 2;
    final int numberOfDots = 22;
    final double radiantStep = 2 * pi / numberOfDots;


    var innerCircle = Paint()
      ..strokeWidth = 0.0
      ..color = const Color.fromRGBO(26, 69, 140, 1)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 150, outerCircle);
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 135, outerSecondCircle);
    // canvas.drawCircle(
    //     Offset(size.width / 2, size.height / 2), 110, dottedCircle);
    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX + sin(i * radiantStep) * 110,
            centerY + cos(i * radiantStep) * 110),
        filledCircleRadius,
        paint,
      );
    }
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 70, innerCircle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}