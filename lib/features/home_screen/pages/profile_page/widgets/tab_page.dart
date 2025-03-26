import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/customized widgets/reusable widgets/customized_card_item.dart';
import '../../../../../core/resources/assets_manager.dart';
import '../../../../../data/model/movie/movie_model.dart';

class TabPage extends StatelessWidget {
  List<MovieModel>? movieList;

  TabPage({required this.movieList});

  @override
  Widget build(BuildContext context) {
    return movieList == null || movieList!.isEmpty
        ? Center(
      child: Image.asset(
        ImageAssets.emptyImage,
        width: 124.w,
        height: 124.h,
      ),
    )
        : CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
              top: 24.h, bottom: 100.h, right: 8.w, left: 8.w),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return CustomizedCardItem(
                  movie: movieList![index],
                );
              },
              childCount: movieList!.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 122.w / 180.h,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
            ),
          ),
        ),
      ],
    );
  }
}
