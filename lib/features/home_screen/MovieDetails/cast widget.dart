import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';

import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';

class CastWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String character;

  const CastWidget({super.key,
    required this.imagePath,
    required this.name,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.darkBlackColor,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        height: 92.h,
        width: 398.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.darkGrayColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  height: 70.h,
                  width: 70.h,
                  imageUrl: imagePath,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CircularProgressIndicator(color: AppColors.whiteColor),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: AppColors.whiteColor),
                ),
              ),
            ),

            SizedBox(width: 15.w), // Added space between image and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildText(
                    context, "${AppLocalizations.of(context)!.name}: $name"),
                SizedBox(height: 5.h),
                _buildText(context,
                    "${AppLocalizations.of(context)!.charactar}: $character"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText(BuildContext context, String text) {
    return DefaultTextStyle(
      style: getRegularStyle(
        color: AppColors.whiteColor,
        fontSize: 16,
        fontFamily: FontConstants.robotoFont,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      child: Text(text),
    );
  }
}
