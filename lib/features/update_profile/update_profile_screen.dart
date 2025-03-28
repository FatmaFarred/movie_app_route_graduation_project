import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/utils/validation_utils.dart';
import 'package:movie_app_route_graduation_project/features/update_profile/widgets/avatar_bottom_sheet.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../core/routes_manager/routes.dart';
import '../../di/di.dart';
import '../../core/customized_widgets/reusable_widgets/custom_dialog.dart';
import '../../core/customized_widgets/reusable_widgets/custom_loading.dart';
import '../../core/customized_widgets/reusable_widgets/custom_text_field.dart';
import '../../core/customized_widgets/reusable_widgets/customized_elevated_button.dart';
import '../../core/resources/app_colors.dart';
import '../../core/resources/font_manager.dart';
import 'cubit/update_profile_cubit.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  List<String> avatarList = [
    ImageAssets.avatar1,
    ImageAssets.avatar2,
    ImageAssets.avatar3,
    ImageAssets.avatar4,
    ImageAssets.avatar5,
    ImageAssets.avatar6,
    ImageAssets.avatar7,
    ImageAssets.avatar8,
    ImageAssets.avatar9,
  ];

  UpdateProfileCubit profileCubit = getIt<UpdateProfileCubit>();

  @override
  void initState() {
    super.initState();
    profileCubit.loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
      bloc: profileCubit,
      listener: (context, state) {
        if (state is UpdateProfileLoadingState ||
            state is DeleteProfileLoadingState) {
          CustomDialog.loading(
              context: context,
              message: getTranslations(context).loading,
              cancelable: false);
        }
        if (state is UpdateProfileSuccessState) {
          Navigator.pop(context);
          CustomDialog.positiveButton(
              context: context,
              title: getTranslations(context).success,
              message: state.response!.message);
          setState(() {});
        }
        if (state is DeleteProfileSuccessState) {
          Navigator.pop(context);
          CustomDialog.positiveButton(
              context: context,
              title: getTranslations(context).success,
              message: state.response!.message,
              positiveOnClick: () => Navigator.of(context)
                  .pushNamedAndRemoveUntil(
                      Routes.loginRoute, (Route<dynamic> route) => false));
        }
        if (state is ProfileErrorState ||
            state is UpdateProfileErrorState ||
            state is DeleteProfileErrorState) {
          if (state is! ProfileErrorState) {
            Navigator.pop(context);
          }
          CustomDialog.positiveButton(
            context: context,
            title: getTranslations(context).error,
            message: (state as dynamic).error.errorMessage,
          );
        }
      },
      buildWhen: (context, state) {
        if (state is ProfileInitialState ||
            state is ProfileLoadingState ||
            state is ProfileSuccessState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is ProfileInitialState || state is ProfileLoadingState) {
          return const CustomLoading();
        }
        if (state is ProfileSuccessState) {
          return buildUpdateProfileSection(state);
        }
        return const Scaffold();
      },
    );
  }

  Widget buildUpdateProfileSection(ProfileSuccessState state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(getTranslations(context).pickAvatar),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
        child: Form(
          key: profileCubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 18.h,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return AvatarBottomSheet(
                          avatarList: avatarList,
                          selectedAvatar: profileCubit.avatarIndex,
                          onChangeAvatar: changeSelectedAvatar,
                        );
                      });
                },
                child: Image.asset(
                  avatarList[profileCubit.selectedAvatar],
                  width: 150.w,
                  height: 150.h,
                ),
              ),
              CustomTextField(
                controller: profileCubit.nameController,
                keyboardType: TextInputType.name,
                prefixIcon: SvgPicture.asset(SvgAssets.icUser,
                    height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                hintText: getTranslations(context).name,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return getTranslations(context).nameIsEmpty;
                  }
                  if (text.length < 5) {
                    return getTranslations(context).nameTooShort;
                  }
                  if (!ValidationUtils.isValidName(text)) {
                    return getTranslations(context).invalidName;
                  }
                  return null;
                },
              ),
              CustomTextField(
                controller: profileCubit.phoneController,
                keyboardType: TextInputType.phone,
                prefixIcon: SvgPicture.asset(SvgAssets.icPhone,
                    height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                hintText: getTranslations(context).phoneNumber,
                validator: (text) {
                  if (text == null || text.trim().isEmpty) {
                    return getTranslations(context).phoneIsEmpty;
                  }
                  if (!ValidationUtils.isValidPhone(text)) {
                    return getTranslations(context).invalidPhone;
                  }
                  return null;
                },
              ),
              SizedBox(
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.changePasswordRoute);
                  },
                  child: Text(
                    getTranslations(context).changePassword,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontFamily: FontConstants.robotoFont),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              const Spacer(),
              CustomizedElevatedButton(
                color: AppColors.redColor,
                borderColor: AppColors.redColor,
                text: getTranslations(context).deleteAccount,
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeightManager.semiBold),
                onPressed: () {
                  CustomDialog.positiveAndNegativeButton(
                      context: context,
                      title: getTranslations(context).warning,
                      message: getTranslations(context).deleteAccountAlert,
                      positiveOnClick: () {
                        Navigator.pop(context);
                        profileCubit.deleteProfile();
                      });
                },
              ),
              CustomizedElevatedButton(
                text: getTranslations(context).updateData,
                textStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.blackColor,
                    fontWeight: FontWeightManager.semiBold),
                onPressed: () {
                  CustomDialog.positiveAndNegativeButton(
                      context: context,
                      title: getTranslations(context).warning,
                      message: getTranslations(context).updateAccountAlert,
                      positiveOnClick: () {
                        Navigator.pop(context);
                        profileCubit.updateProfile();
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void changeSelectedAvatar(int index) {
    profileCubit.avatarIndex = index;
  }
}
