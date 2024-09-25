import 'package:flutter/material.dart';

class ScreenWrapperPage extends StatelessWidget {
  final Widget child;
  const ScreenWrapperPage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: child,
    );
  }
}