import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreen.dart';

import '../../../../core/resources/style manager.dart';
import '../Textwidget.dart';

class Moviesuggetionwidget extends StatelessWidget {
  String imagePath;
  String title;
  final String movieid;

  Moviesuggetionwidget({required this.imagePath, required this.title, required this.movieid});

  @override
  Widget build(BuildContext context) {
    return Material(  // Wrap the InkWell with a Material widget
      color: Colors.transparent,  // Use transparent color so that it doesn't affect your UI design
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Moviedetailsscreen(movieId: movieid),
            ),
          );
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                height: 279.h,
                width: 189.w,
                imageUrl: imagePath,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(color: AppColors.whiteColor),
                errorWidget: (context, url, error) => Icon(Icons.error, color: AppColors.whiteColor),
              ),
            ),
            Container(
              margin: EdgeInsetsDirectional.symmetric(horizontal: 13.w, vertical: 10.h),
              width: 58.w,
              height: 28.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.lightGrey,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextWidget(
                    text: title,
                    style: getRegularStyle(color: AppColors.whiteColor, fontSize: 16),
                  ),
                  SvgPicture.asset(SvgAssets.icRate, height: 15.h, width: 15.w),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

