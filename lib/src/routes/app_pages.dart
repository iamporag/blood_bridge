import 'package:blood_bridge/src/presentation/screens/home/drawer/drawer_page.dart';
import 'package:blood_bridge/src/presentation/screens/navbar.dart';
import 'package:blood_bridge/src/presentation/screens/profile.dart';
import 'package:blood_bridge/src/presentation/screens/login_screen.dart';
import 'package:blood_bridge/src/presentation/screens/onboarding.dart';
import 'package:blood_bridge/src/presentation/screens/search_screen.dart';
import 'package:blood_bridge/src/presentation/screens/signup_screen.dart';
import 'package:blood_bridge/src/presentation/screens/splash_screen.dart';
import 'package:blood_bridge/src/presentation/widgets/screen_wrapper_page.dart';
import 'package:blood_bridge/src/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppPages {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: Routes.SPLASH_SCREEN_ROUTE.path,
        name: Routes.SPLASH_SCREEN_ROUTE.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: SplashScreen(),
        ),
      ),
      GoRoute(
        path: Routes.ONBOARDING_SCREEN_ROUTE.path,
        name: Routes.ONBOARDING_SCREEN_ROUTE.name,
        pageBuilder: (context, state) => MaterialPage(
          child: OnboardingScreen(),
        ),
      ),
      GoRoute(
        path: Routes.REGISTRATION_SCREEN_ROUTE.path,
        name: Routes.REGISTRATION_SCREEN_ROUTE.name,
        pageBuilder: (context, state) =>  const MaterialPage(
          child: SignupScreen(),
        ),
      ),
      GoRoute(
        path: Routes.LOGIN_SCREEN_ROUTE.path,
        name: Routes.LOGIN_SCREEN_ROUTE.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.PROFILE_ROUTE.path,
        name: Routes.PROFILE_ROUTE.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: Profile(),
        ),
      ),
      GoRoute(
        path: Routes.SEARCH_ROUTE.path,
        name: Routes.SEARCH_ROUTE.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: SearchScreen(),
        ),
      ),
      GoRoute(
        path: Routes.DRAWER_SCREEN_ROUTE.path,
        name: Routes.DRAWER_SCREEN_ROUTE.name,
        pageBuilder: (context, state) => const MaterialPage(
          child: DrawerPage(),
        ),
      ),
      ShellRoute(
          builder: (context, state, child) => ScreenWrapperPage(child: child),
          routes: [
            GoRoute(
              path: Routes.NAVBAR_SCREEN_ROUTE.path,
              name: Routes.NAVBAR_SCREEN_ROUTE.name,
              pageBuilder: (context, state) => const MaterialPage(
                child: Navbar(),
              ),
            ),
          ])
    ],
  );
}
