import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/app_colors.dart';


typedef OnButtonClick = void Function(int);

class AvatarBottomSheet extends StatefulWidget {

  List<String> avatarList;

  int selectedAvatar;

  OnButtonClick onChangeAvatar;

  AvatarBottomSheet(
      {required this.avatarList,
        required this.selectedAvatar,
        required this.onChangeAvatar});

  @override
  State<AvatarBottomSheet> createState() => _AvatarBottomSheetState();
}

class _AvatarBottomSheetState extends State<AvatarBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
          color: AppColors.darkGrayColor,
          borderRadius: BorderRadius.all(Radius.circular(24.r))),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.all(18.h),
          itemCount: widget.avatarList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 18.h,
            crossAxisSpacing: 18.w,
          ),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  widget.selectedAvatar = index;
                  widget.onChangeAvatar(index);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    color: widget.selectedAvatar == index
                        ? AppColors.orangeColorTransparent
                        : AppColors.darkGrayColor,
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    border:
                        Border.all(color: AppColors.orangeColor, width: 1.w)),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Image.asset(
                    widget.avatarList[index],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
