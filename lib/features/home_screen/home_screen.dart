import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';

import 'home_widgets.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  static final GlobalKey<_HomeScreenState> homeScreenKey = GlobalKey();

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  void changeTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          taps[selectedIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 8.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    onTap: (index) {
                      changeTab(index);
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
              ),
            ),
          )
        ]),
      ),
    );
  }
}
