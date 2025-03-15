import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';
import 'package:movie_app_route_graduation_project/features/home/pages/explore_page/explore_page.dart';
import 'package:movie_app_route_graduation_project/features/home/pages/home_page/home_page.dart';
import 'package:movie_app_route_graduation_project/features/home/pages/profile_page/profile_page.dart';
import 'package:movie_app_route_graduation_project/features/home/pages/search_page/search_page.dart';

List<BottomNavigationBarItem> generateBottomNavItems(
    Map<String, String> iconMap) {
  return iconMap.entries
      .map((entry) => BottomNavigationBarItem(
      icon: SvgPicture.asset(entry.key),
      activeIcon: SvgPicture.asset(entry.key, color: AppColors.orangeColor),
      backgroundColor: AppColors.darkGrayColor,
      label: entry.value,))
      .toList();
}
List<Widget> taps = [
  const HomePage(),
  const SearchPage(),
  const ExplorePage(),
  const ProfilePage(),
];