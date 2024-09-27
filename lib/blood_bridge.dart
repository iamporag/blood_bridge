// ignore_for_file: deprecated_member_use
import 'package:blood_bridge/src/bloc/bloc/nav_bar_bloc.dart';
import 'package:blood_bridge/src/bloc/cubit/splash_screen_cubit.dart';
import 'package:blood_bridge/src/routes/app_pages.dart';
import 'package:blood_bridge/src/utils/app_themes.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodBridge extends StatelessWidget {
  const BloodBridge({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashScreenCubit()..StartSplash()),
        BlocProvider(create: (context) => NavBarBloc())
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          // return MaterialApp(
          //   home:

          //   BlocProvider(
          //     create: (context) => NavigationBloc(),
          //     child: Test(),
          //   ),
          // );
          return MaterialApp.router(
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            themeMode: ThemeMode.system,
            theme: AppThemes.defaultTheme,
            routerConfig: AppPages.routes,
          );
        },
      ),
    );
  }
}
