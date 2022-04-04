import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:the_dental_app/utils/colors.dart';
import 'dart:ui' as UI;

import 'package:flutter/services.dart';

Future<UI.Image> loadUiImage(String imageAssetPath) async {
  final ByteData data = await rootBundle.load(imageAssetPath);
  final Completer<UI.Image> completer = Completer();
  UI.decodeImageFromList(Uint8List.view(data.buffer), (UI.Image img) {
    return completer.complete(img);
  });
  return completer.future;
}

class CustomClockPaint extends CustomPainter {
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
    var firstIcon = Paint()
      ..strokeWidth = 3
      ..color = PRIMARY_COLOR
      ..style = PaintingStyle.fill;
    var secIcon = Paint()
      ..strokeWidth = 3
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    var thirdIcon = Paint()
      ..strokeWidth = 3
      ..color = Colors.white
      ..style = PaintingStyle.fill;
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
    var line = Paint()
      ..strokeWidth = 4.0
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 150, outerCircle);

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), 135, outerSecondCircle);
    canvas.drawLine(
        Offset(size.width * 2, 10), Offset(size.width * 2.8, 10), line);
    // canvas.drawCircle(
    //     Offset(size.width / 2, size.height / 2), 110, dottedCircle);

    for (int i = 0; i < numberOfDots; i++) {
      canvas.drawCircle(
        Offset(centerX + sin(i * radiantStep) * 105,
            centerY + cos(i * radiantStep) * 105),
        filledCircleRadius,
        paint,
      );
    }

    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 70, innerCircle);
    canvas.drawCircle(Offset(120, -100), 20, firstIcon);
    canvas.drawCircle(Offset(-75, 100), 20, secIcon);
    canvas.drawCircle(Offset(35, 150), 20, thirdIcon);
    // canvas.drawImage(loadUiImage("imageAssetPath"), Offset(50.0, 50.0), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
