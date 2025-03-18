import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/dependency%20injection/Di.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/custom_dialog.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/utils/validation_utils.dart';
import 'package:movie_app_route_graduation_project/features/auth/change/cubit/change_password_cubit.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../core/customized widgets/reusable widgets/Customized Elevated bottom.dart';
import '../../../core/customized widgets/reusable widgets/custom_text_field.dart';
import '../../../core/resources/App_colors.dart';
import '../../../core/resources/font_manager.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  ChangePasswordCubit changePasswordCubit = getIt<ChangePasswordCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      bloc: changePasswordCubit,
      listener: (context, state) {
        switch (state) {
          case ChangePasswordInitialState():
          case ChangePasswordLoadingState():
            CustomDialog.loading(
                context: context,
                message: getTranslations(context).loading,
                cancelable: false);
          case ChangePasswordSuccessState():
            Navigator.pop(context);
            CustomDialog.positiveButton(
                context: context,
                title: getTranslations(context).success,
                message: state.changePassword!.message,
                positiveOnClick: () {
                  Navigator.pop(context);
                });
          case ChangePasswordErrorState():
            Navigator.pop(context);
            CustomDialog.positiveButton(
                context: context,
                title: getTranslations(context).error,
                message: state.error.errorMessage,
                positiveOnClick: () {
                  Navigator.pop(context);
                });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            getTranslations(context).changePassword,
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: changePasswordCubit.formKey,
            child: Column(
              children: [
                SvgPicture.asset(SvgAssets.forgotPasswordImage),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomTextField(
                    controller: changePasswordCubit.oldPasswordController,
                    keyBoardType: TextInputType.text,
                    prefixIcon: SvgPicture.asset(SvgAssets.icPassword,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: getTranslations(context).oldPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: !isPasswordVisible,
                    validator: passwordValidator,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomTextField(
                    controller: changePasswordCubit.newPasswordController,
                    keyBoardType: TextInputType.text,
                    prefixIcon: SvgPicture.asset(SvgAssets.icPassword,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: getTranslations(context).newPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isConfirmPasswordVisible = !isConfirmPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isConfirmPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: !isConfirmPasswordVisible,
                    validator: passwordValidator,
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: CustomeizedElevatedButtom(
                    text: getTranslations(context).changePassword,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.blackColor,
                        fontWeight: FontWeightManager.semiBold),
                    onpressed: () {
                      changePasswordCubit.changePassword();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? passwordValidator(String? text) {
    if (text == null || text.trim().isEmpty) {
      return getTranslations(context).passwordIsEmpty;
    }
    if (text.length < 8) {
      return getTranslations(context).passwordTooShort;
    }
    if (!ValidationUtils.isValidPassword(text)) {
      return getTranslations(context).invalidPassword;
    }
    return null;
  }
}
