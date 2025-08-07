// ignore_for_file: deprecated_member_use
import 'package:blood_bridge/src/bloc/bloc/nav_bar_bloc.dart';
import 'package:blood_bridge/src/bloc/carousel/carousel_bloc.dart';
import 'package:blood_bridge/src/bloc/cubit/splash_screen_cubit.dart';
import 'package:blood_bridge/src/data/dummy/repository/repository.dart';
import 'package:blood_bridge/src/routes/app_pages.dart';
import 'package:blood_bridge/theme/light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BloodBridge extends StatelessWidget {
  const BloodBridge({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => BridgeRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CarouselBloc(context.read<BridgeRepository>())
              ..add(
                FetchCarouselData(),
              ),
          ),
          BlocProvider(create: (context) => SplashScreenCubit()..StartSplash()),
          BlocProvider(create: (context) => NavBarBloc()),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: light,
          routerConfig: AppPages.routes,
        ),
      ),
    );
  }
}
