import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';

class ScreenShotWidget extends StatelessWidget {
  final String imagePath;
  final double? height;
  final double? width;

  const ScreenShotWidget({super.key, required this.imagePath, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imagePath,
      imageBuilder: (context, imageProvider) => Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill, // Ensures the image fills the container
          ),
        ),
      ),
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.blackColor,
          backgroundColor: AppColors.whiteColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
        color: AppColors.whiteColor,
      ),
    );
  }
}
