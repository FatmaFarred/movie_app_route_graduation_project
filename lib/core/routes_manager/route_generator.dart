import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/features/auth/Reigster/Resister_Screen.dart';
import 'package:movie_app_route_graduation_project/features/auth/login/login_screen.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/home_screen.dart';
import 'package:movie_app_route_graduation_project/features/onboarding/onboarding_screen.dart';
import 'package:movie_app_route_graduation_project/features/welcome/welcome_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcomeRoute:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        case Routes.loginRoute:
          return MaterialPageRoute(builder: (_) => LoginView());
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
