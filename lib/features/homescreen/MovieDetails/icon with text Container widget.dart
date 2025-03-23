import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';

class iconWithTextContainerWidget  extends StatelessWidget {
  String imagePath ;
  String title ;

  iconWithTextContainerWidget ({required this.imagePath,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(12),
      color: AppColors.darkGrayColor,

    ),
      child:Row(children: [SvgPicture.asset(imagePath,height: 28.h,width: 28.h,),Text(title)], ) ,
    );
  }
}
