// ignore_for_file: deprecated_member_use, unnecessary_null_in_if_null_operators


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String hintText;
  final bool? obscureText;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    this.obscureText,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5.5),
        ),
        prefixIcon: prefixIcon ?? null,
        suffixIcon: suffixIcon ?? null,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.outlineVariant,
              fontSize: 12.sp,
            ),
        filled: true,
        fillColor: const Color(0xffE41B1E).withOpacity(0.2),
      ),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.outlineVariant,
            fontSize: 12.sp,
          ),
    );
  }
}
