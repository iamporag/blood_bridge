import 'package:blood_bridge/src/constants/app_icons.dart';
import 'package:blood_bridge/src/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      context.pop(context);
    }, 
    icon: SvgPicture.asset(AppIcons.arrowBackward));
  }
}