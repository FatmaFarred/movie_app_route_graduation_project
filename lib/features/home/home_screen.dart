import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/features/home/home_widgets.dart';

import '../../core/resources/assets_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            items: generateBottomNavItems({
              SvgAssets.icHome: "",
              SvgAssets.icSearch: "",
              SvgAssets.icExplore: "",
              SvgAssets.icProfile: "",
            })),
        body: taps[selectedIndex],
      ),
    );
  }
}
