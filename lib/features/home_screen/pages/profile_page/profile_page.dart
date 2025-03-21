import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/style%20manager.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/profile_page/profile_widgets.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/profile_page/watchlist_page.dart';

import 'history_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: AppColors.darkGrayColor,
            child: Column(
              children: [
                profileInfo(),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FilledButton(
                          onPressed: () {},
                          child: Text(
                            "Edit Profile",
                            style: getBoldStyle(
                                fontSize: 20, color: AppColors.blackColor),
                          )),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor: AppColors.redColor),
                        onPressed: () {},
                        child: SizedBox(
                          width: 120,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // Center horizontally
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Exit",
                                  textAlign: TextAlign.center,
                                  style: getBoldStyle(
                                      fontSize: 20,
                                      color: AppColors.whiteColor)),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.logout,
                                color: AppColors.whiteColor,
                                size: 24,
                              )
                            ],
                          ),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TabBar(
                    indicatorColor: AppColors.orangeColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    tabs: [
                      buildTabItem("Watchlist", SvgAssets.icList),
                      buildTabItem("History", SvgAssets.icFolder)
                    ])
              ],
            ),
          ),
          const Expanded(child: TabBarView(children: [
            WatchlistPage(),
            HistoryPage()
          ]))
        ],
      )),
    );
  }
}
