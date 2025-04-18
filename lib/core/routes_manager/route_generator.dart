import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/features/auth/change/change_password_screen.dart';
import 'package:movie_app_route_graduation_project/features/auth/forget/forget_screen.dart';
import 'package:movie_app_route_graduation_project/features/auth/login/login_screen.dart';
import 'package:movie_app_route_graduation_project/features/onboarding/onboarding_screen.dart';
import 'package:movie_app_route_graduation_project/features/welcome/welcome_screen.dart';

import '../../features/auth/register/register_screen.dart';
import '../../features/home_screen/home_screen.dart';
import '../../features/update_profile/update_profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.forgetRoute:
        return MaterialPageRoute(builder: (_) => const ForgetScreen());
      case Routes.changePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(key: HomeScreen.homeScreenKey));

      case Routes.updateProfileRoute:
        return MaterialPageRoute(builder: (_) => const UpdateProfileScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
