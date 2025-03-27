import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app_route_graduation_project/core/resources/style%20manager.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/font_manager.dart';

class CastWidget extends StatelessWidget {
  String imagePath ;
  String Name;
  String character ;

  CastWidget ({required this.imagePath, required this.Name, required this.character});
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: AppColors.darkBlackColor,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        height: 92.h,
       width: 398.w,
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: AppColors.darkGrayColor),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal:15.w ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                height: 70.h,
                width:70.h ,
      
                imageUrl: imagePath,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(color:AppColors.whiteColor),
                errorWidget: (context, url, error) => Icon(Icons.error,color:AppColors.whiteColor),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextStyle(
                style: getRegularStyle(
            color: AppColors.whiteColor,
            fontSize: 16,
             fontFamily: FontConstants.robotoFont,
              ),
                child: Text(
                  "${AppLocalizations.of(context)!.name}: $Name",
      
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(height: 5.h),
              DefaultTextStyle(
                style: getRegularStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontFamily: FontConstants.robotoFont,
                ),
                child: Text(
                  "${AppLocalizations.of(context)!.charactar}: $character",
      
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
        ),
      ),
    );
  }
}