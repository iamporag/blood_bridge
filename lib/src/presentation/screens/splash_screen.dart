// ignore_for_file: unused_local_variable

import 'package:blood_bridge/src/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../bloc/cubit/splash_screen_cubit.dart';
import '../../routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    final iconSize =
        mediaQuery.size.width * 0.04; // Icon size is 20% of the screen width

    final isPortrait = mediaQuery.orientation == Orientation.portrait;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocListener<SplashScreenCubit, SplashScreenState>(
        listener: (context, state) {
          if (state is EndSplashScreen) {
            context.goNamed(Routes.NAVBAR_SCREEN_ROUTE.name);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset(
                AssetsManager.LOGO,
                width: screenWidth * 0.3,
              ),
              const Spacer(),
              LottieBuilder.asset(
                'assets/animations/loading.json',
                width: screenWidth * 0.3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
