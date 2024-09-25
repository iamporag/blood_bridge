// ignore_for_file: use_super_parameters


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCenterTextSvg extends StatelessWidget {
  final String svgPath;
  final String text;
  final TextStyle textStyle;

  const CustomCenterTextSvg({
    Key? key,
    required this.svgPath,
    required this.text,
    this.textStyle = const TextStyle(
      fontSize: 24,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          svgPath,
          fit: BoxFit.contain,
          width: 35.w,
          // You can set width, height, or use constraints if needed.
        ),
        Text(
          text,
          style: textStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
