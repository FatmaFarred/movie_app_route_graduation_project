import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvatarWidget extends StatelessWidget {
  String avatarPATH;

  AvatarWidget({super.key, required this.avatarPATH});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158.h,
      width: 158.w,
      child: Image.asset(
        avatarPATH,
        fit: BoxFit.fill,
      ),
    );
  }
}
