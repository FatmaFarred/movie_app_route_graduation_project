import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';

import 'home_widgets.dart';

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
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            backgroundColor: AppColors.darkGrayColor,
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
