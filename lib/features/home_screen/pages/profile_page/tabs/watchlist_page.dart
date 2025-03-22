import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/domain/entities/add_favorite.dart';
import 'package:movie_app_route_graduation_project/domain/entities/favorites.dart';

import '../../../../../core/customized widgets/reusable widgets/customized_card_item.dart';
import '../../../../../core/resources/assets_manager.dart';

class WatchlistPage extends StatelessWidget {
  List<Favorites> favoriteList;

  WatchlistPage({required this.favoriteList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          padding: EdgeInsets.only(
              top: 24.h, bottom: 100.h, right: 8.w, left: 8.w),
          itemCount: favoriteList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 122.w / 180.h,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h),
          itemBuilder: (context, index) {
            return CustomizedCardItem(
              movieId: favoriteList[index].movieId!,
              name: favoriteList[index].name!,
              imageURL: favoriteList[index].imageURL!,
              year: favoriteList[index].year!,
              rating: favoriteList[index].rating!,
            );
          }),
    );
  }
}
