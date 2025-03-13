import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/app_theme.dart';

import 'features/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName: (_) => const HomeScreen()},
    );
  }
}
