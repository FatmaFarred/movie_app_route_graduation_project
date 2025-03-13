import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';

class CustomizedElevatedButtom extends StatelessWidget {
  Color? borderColor;
  Color? color;
  String text;
  Widget? iconImage;
  TextStyle? style;
  Function ? onPressed;
  CustomizedElevatedButtom ({ this.borderColor,
    this.color, required this.text, this.iconImage, this.style, this.onPressed});
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  ElevatedButton(

        style: ElevatedButton.styleFrom(elevation: 0,
            padding: EdgeInsets.symmetric(vertical: height*0.01,horizontal: width*0.04),
            shape: RoundedRectangleBorder(side: BorderSide(color:borderColor ??AppColors.orangeColor),
                borderRadius: BorderRadius.circular(16)),backgroundColor:color ?? AppColors.orangeColor),
        onPressed: () { //NAVIGATION
          if (onPressed != null) {
            onPressed!();
          };

        },
        child:  Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconImage ??SizedBox(),
            SizedBox(width: width*0.01,),
            Text(text,)

          ],)
    );
  }
}
