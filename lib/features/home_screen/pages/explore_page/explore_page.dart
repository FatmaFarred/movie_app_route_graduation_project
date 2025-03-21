import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/customized_card_item.dart';

import '../../../../core/resources/app_colors.dart';
import 'explore_widgets.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Number of tabs
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
                centerTitle: false,
                automaticallyImplyLeading: false,
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    unselectedLabelColor: AppColors.orangeColor,
                    labelColor: AppColors.blackColor,
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: AppColors.orangeColor),
                    tabs: [
                      tabItem("All"),
                      tabItem("Action"),
                      tabItem("Comedy"),
                      tabItem("Adventure"),
                      tabItem("Animation"),
                    ],
                  ),
                )),
            body: Container(
              margin: const EdgeInsets.only(top: 24, left: 8, right: 8),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .7,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 5,
                  ),
                  itemBuilder: (context, index) {
                    return SizedBox(
                        child: FilmCardItem(index: index,));
                  }),
            )),
      ),
    );
  }
}