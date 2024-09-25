// ignore_for_file: unused_local_variable

import 'dart:ui';

import 'package:blood_bridge/src/presentation/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../routes/routes.dart';
import '../widgets/custom_text_form_field.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      resizeToAvoidBottomInset: false,
        // body: NestedScrollView(
        //   headerSliverBuilder: (context, innerBoxIsScrolled) => [

        //   ],
        body: Stack(
          children: [
            Align(
                  alignment: const AlignmentDirectional(20, -1.2),
                  child: Container(
                    height: screenWidth,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.tertiary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(20, 1.2),
                  child: Container(
                    height: screenWidth,
                    width: screenWidth,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.tertiary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-2.7, -1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(2.7, -1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-2.7, 1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(2.7, 1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.secondary),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(2.7, -1.2),
                  child: Container(
                    height: screenWidth / 1.3,
                    width: screenWidth / 1.3,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: theme.colorScheme.primary),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                  child: Container(),
                ),
            CustomScrollView(
                slivers: [
          // SliverAppBar(
          //   pinned: true,
          //   expandedHeight: 200.0,
          //   flexibleSpace: FlexibleSpaceBar(
          //     title: Text('Login'),
          //     centerTitle: true,
          //     background: Image.network(
          //       'https://images.pexels.com/photos/956999/milky-way-starry-sky-night-sky-star-956999.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListTile(
                    title: Text(
                      "Let's Join Us",
                       style: theme.textTheme.headlineLarge?.copyWith(
                        color: theme.colorScheme.onSurface,
                           fontSize: 32.sp
                      ),
                      textAlign: TextAlign.center,
                    ),
                    subtitle: Text(
                      "Welcome to Blood Bridge, where every drop counts. By registering, you become a vital link in a network of life-saving donors. Together, we connect those in need with those who can give, making a difference, one donation at a time.",
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: theme.colorScheme.outlineVariant,
                          fontSize: 12.sp
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    hintText: "Your Name",
                    prefixIcon: Icon(
                      Icons.turned_in_not_outlined,
                      color: theme.colorScheme.outlineVariant,
                    ),
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.account_circle_outlined,
                      color:theme.colorScheme.outlineVariant,
                    ),
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    obscureText: true,
                    hintText: "Password",
                    prefixIcon: Icon(
                      Icons.lock_person_outlined,
                      color:theme.colorScheme.outlineVariant,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color:theme.colorScheme.outlineVariant,
                    ),
                  ),
                  const Gap(20),
                  CustomTextFormField(
                    obscureText: true,
                    hintText: "Confirm Password",
                    prefixIcon: Icon(
                      Icons.lock_person_outlined,
                      color:theme.colorScheme.outlineVariant,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                      color:theme.colorScheme.outlineVariant,
                    ),
                  ),
                  const Gap(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 0,
                        groupValue: 0,
                        onChanged: (value) {},
                        fillColor: WidgetStatePropertyAll(
                          theme.colorScheme.outlineVariant,
                        ),
                      ),
                      Text(
                        "I agree with the Terms of Service & Privacy Policy",
                        style: theme.textTheme.displayLarge?.copyWith(
                          color: theme.colorScheme.outlineVariant,
                            fontSize: 12.sp
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  CustomButton(
                    onTap: () {
                      context.go(Routes.NAVBAR_SCREEN_ROUTE.path);
                    },
                    title: "Sign up",
                  ),
                  const Gap(10),
                  RichText(
                    text: TextSpan(
                      text: "Have an account? ",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface,
                          fontSize: 12.sp
                      ),
                      children: [
                        TextSpan(
                            text: ' Login here',
                            style: theme.textTheme.titleSmall?.copyWith(
                              color: theme.colorScheme.error,
                                fontSize: 12.sp,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                context.go(Routes.LOGIN_SCREEN_ROUTE.path);
                              }),
                      ],
                    ),
                  ),
                  // const Spacer(),
                ],
              ),
            ),
          ),
                ],
              ),
        ]
        // ),
        ));
  }
}
