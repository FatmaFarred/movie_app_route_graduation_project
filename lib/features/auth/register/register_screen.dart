import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';

import '../../../core/customized_widgets/reusable_widgets/custom_dialog.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../core/routes_manager/routes.dart';
import '../../../core/utils/validation_utils.dart';
import '../../../di/di.dart';

import '../../../core/customized_widgets/reusable_widgets/custom_text_field.dart';
import '../../../core/customized_widgets/reusable_widgets/customized_elevated_button.dart';
import '../../../l10n/app_translations.dart';
import '../../../l10n/cubit/locale_cubit.dart';
import '../login/widgets/language_switch.dart';
import 'avatar_widget.dart';
import 'Register_cubit/register_state.dart';
import 'Register_cubit/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterViewModel registerViewModel = getIt<RegisterViewModel>();

  int selectedIndex = 0;

  bool showPassword = false;
  bool showConfirmPassword = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, RegisterState>(
      bloc: registerViewModel,
      listener: (context, state) {
        if (state is LoadingRegisterState) {
          CustomDialog.loading(
              context: context,
              message: getTranslations(context).loading,
              cancelable: false);
        } else if (state is ErrorRegisterState) {
          Navigator.of(context).pop();
          CustomDialog.positiveButton(
              context: context,
              title: getTranslations(context).error,
              message: state.error.errorMessage);
        } else if (state is SuccessRegisterState) {
          Navigator.of(context).pop();
          CustomDialog.positiveButton(
              context: context,
              title: getTranslations(context).success,
              message: state.response.message,
              positiveOnClick: () =>
                  Navigator.of(context).pushReplacementNamed(Routes.homeRoute));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTranslations(context).register),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            child: Form(
              key: registerViewModel.formKey,
              child: Column(
                children: [
                  CarouselSlider.builder(
                      itemCount: AppConstants.avatarList.length,
                      itemBuilder: (context, index, itemIndex) {
                        return InkWell(
                            onTap: () {},
                            child: AvatarWidget(
                              avatarPATH: AppConstants.avatarList[index],
                            ));
                      },
                      options: CarouselOptions(
                          enlargeCenterPage: true,
                          initialPage: 0,
                          height: 160.h,
                          disableCenter: true,
                          enlargeFactor: 0.6,
                          viewportFraction: 0.37,
                          onPageChanged: (index, _) {
                            selectedIndex = index;
                            registerViewModel.selectedAvatar = selectedIndex;
                            setState(() {});
                          })),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(getTranslations(context).avatar,
                      style: getRegularStyle()),
                  SizedBox(height: 12.h),

                  CustomTextField(
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
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    prefixIcon: SvgPicture.asset(SvgAssets.icName,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: getTranslations(context).name,
                    controller: registerViewModel.nameController,
                  ),

                  SizedBox(height: 24.h),
                  CustomTextField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return getTranslations(context).emailIsEmpty;
                      }
                      if (!ValidationUtils.isValidEmail(text)) {
                        return getTranslations(context).invalidEmail;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    prefixIcon: SvgPicture.asset(SvgAssets.icEmail,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: getTranslations(context).email,
                    controller: registerViewModel.emailController,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return getTranslations(context).passwordIsEmpty;
                      }
                      if (!ValidationUtils.isValidPassword(text)) {
                        return getTranslations(context).invalidPassword;
                      }
                      if (text.length < 8) {
                        return getTranslations(context).passwordTooShort;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    prefixIcon: SvgPicture.asset(SvgAssets.icPassword,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: getTranslations(context).password,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(
                        showPassword ? Icons.visibility : Icons.visibility_off,
                      ),
                    ),
                    obscureText: !showPassword,
                    controller: registerViewModel.passwordController,
                  ),
                  SizedBox(height: 24.h),

                  CustomTextField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return getTranslations(context).confirmPasswordIsEmpty;
                      }
                      if (text !=
                          registerViewModel.confirmPasswordController.text) {
                        return getTranslations(context)
                            .confirmPasswordDoesNotMatch;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    prefixIcon: SvgPicture.asset(SvgAssets.icPassword,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: getTranslations(context).confirmPassword,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showConfirmPassword = !showConfirmPassword;
                        });
                      },
                      icon: Icon(
                        showConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    obscureText: !showConfirmPassword,
                    controller: registerViewModel.confirmPasswordController,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return getTranslations(context).phoneIsEmpty;
                      }
                      if (!ValidationUtils.isValidPhone(text)) {
                        return getTranslations(context).invalidPhone;
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    prefixIcon: SvgPicture.asset(SvgAssets.icPhone,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: getTranslations(context).phoneNumber,
                    controller: registerViewModel.phoneNumberController,
                  ),

                  SizedBox(height: 24.h),
                  CustomizedElevatedButton(
                    onPressed: () {
                      registerViewModel.register();
                    },
                    text: getTranslations(context).createAccount,
                  ),

                  SizedBox(height: 18.h),

                  // Create Account RichText
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "${getTranslations(context).alreadyHaveAccount} ",
                          style: getRegularStyle(fontSize: FontSize.s14),
                        ),
                        TextSpan(
                          text: getTranslations(context).login,
                          style: const TextStyle(
                            color: AppColors.orangeColor,
                            fontSize: FontSize.s14,
                            fontWeight: FontWeight.w900,
                            fontFamily: FontConstants.robotoFont,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushNamed(Routes.loginRoute);
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 18.h),

                  LanguageSwitch(
                      currentLocale: context.read<LocaleCubit>().state,
                      onChanged: (Locale newLocale) {
                        context.read<LocaleCubit>().changeLocale(newLocale);
                      }),

                  SizedBox(height: 18.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPositiveAction(BuildContext context) {
    Navigator.of(context).pop();
  }
}
