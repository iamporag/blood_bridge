// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'dart:ui';

import 'package:blood_bridge/src/presentation/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';
import '../widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    void _showForgotPasswordDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        color: Colors.black.withOpacity(0),
                      ),
                    ),
                  ),
                  AlertDialog(
              title: Center(
                child: Text(
                  'Forgot Password',
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontFamily: "Oswald",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                     Center(
                      child: Text(
                        'For reset your Password? Please Enter your email address to receive a password reset link.',
                        style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: "Oswald",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                  ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Gap(16),
                    CustomTextFormField(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.redAccent.shade700.withOpacity(0.3),
                      ),
                    ),
                    const Gap(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child:  Text('Cancel',style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: "Oswald",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                  ),),
                        ),
                        const Gap(8),
                        ElevatedButton(
                          onPressed: () {
                            // Handle the forgot password logic here
                            Navigator.of(context).pop();
                          },
                          child: Text('Submit',style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: "Oswald",
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                  ),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              contentPadding: const EdgeInsets.all(10),
            ),
                ],
              ));
        },
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      
    );
  }
}
