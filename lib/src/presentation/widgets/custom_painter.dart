// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  final double firstValue;
  final double secondValue;
  final double thirdValue;
  final double fourthValue;

  MyPainter(
      {super.repaint,
      required this.firstValue,
      required this.secondValue,
      required this.thirdValue,
      required this.fourthValue});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xff3B6ABA).withOpacity(0.8)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(0, size.height / firstValue)
      ..cubicTo(size.width * 0.4, size.height / secondValue, size.width * 0.7,
          size.height / thirdValue, size.width, size.height / fourthValue)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
    
  }
}
