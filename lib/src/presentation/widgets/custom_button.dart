// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final Color? backgroundColor;
  final Color? textColor;
  final Widget? buttonChild;
  const CustomButton({
    super.key,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    required this.title,
    this.buttonChild,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.colorScheme.error,
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          //   colors: [
          //     theme.colorScheme.error,
          //     theme.colorScheme.tertiary,
          //   ],
          // ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.0),
              blurRadius: 10.r,
              offset: const Offset(0, 5),
              spreadRadius: 0.2,
            ), //BoxShadow
          ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: theme.colorScheme.tertiary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 50.h,
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //   color: backgroundColor ??
            //       Theme.of(context).colorScheme.onPrimaryContainer,
            // ),
            child: Center(
              child: buttonChild ??
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: textColor ??
                              Theme.of(context).colorScheme.background,
                        fontSize: 21.sp
                        ),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
