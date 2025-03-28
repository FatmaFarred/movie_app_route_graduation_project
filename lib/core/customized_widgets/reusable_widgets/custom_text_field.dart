import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';

import '../../resources/style_manager.dart';

typedef MyValidator = String? Function(String?);
typedef OnFieldSubmitted = void Function(String?);

class CustomTextField extends StatelessWidget {
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? hintText;
  bool obscureText;
  MyValidator? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;
  TextInputAction? textInputAction;
  OnFieldSubmitted? onFieldSubmitted;
  CustomTextField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.keyboardType,
    this.textInputAction,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.onFieldSubmitted,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      style: getRegularStyle(color: AppColors.whiteColor),
      obscureText: obscureText,
      obscuringCharacter: '*',
      cursorColor: AppColors.orangeColor,
      decoration: InputDecoration(
        errorStyle: getRegularStyle(color: AppColors.redColor),
        suffixIcon: suffixIcon,
        suffixIconColor: AppColors.whiteColor,
        prefixIcon: prefixIcon,
        prefixIconColor: AppColors.whiteColor,
        hintText: hintText,
        hintStyle: getRegularStyle(color: AppColors.whiteColor),
        filled: true,
        fillColor: AppColors.darkGrayColor,
        enabledBorder: customOutlineInputBorder(),
        focusedBorder: customOutlineInputBorder(),
        errorBorder: customOutlineInputBorder(),
        focusedErrorBorder: customOutlineInputBorder(),
      ),
      onFieldSubmitted: onFieldSubmitted,
    );
  }

  InputBorder customOutlineInputBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: const BorderSide(
          color: AppColors.darkGrayColor,
          width: 2,
        ));
  }
}
