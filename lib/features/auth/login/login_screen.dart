import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_route_graduation_project/core/customized_widgets/reusable_widgets/custom_dialog.dart';

import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/font_manager.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/core/utils/validation_utils.dart';
import 'package:movie_app_route_graduation_project/features/auth/login/widgets/language_switch.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../core/resources/style_manager.dart';
import '../../../di/di.dart';
import '../../../core/customized_widgets/reusable_widgets/custom_text_field.dart';
import '../../../core/customized_widgets/reusable_widgets/customized_elevated_button.dart';
import '../../../core/resources/app_colors.dart';

import '../../../l10n/cubit/locale_cubit.dart';
import 'login_cubit/login_state.dart';
import 'login_cubit/login_view_model.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'Login_screen';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginViewModel = getIt<LoginViewModel>();
  bool showPassword = false;

  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, LoginState>(
      bloc: loginViewModel,
      listener: (context, state) {
        if (state is LoadingLoginState) {
          CustomDialog.loading(
              context: context,
              message: getTranslations(context).loading,
              cancelable: false);
        } else if (state is ErrorLoginState) {
          Navigator.of(context).pop();
          CustomDialog.positiveButton(
              context: context,
              title: getTranslations(context).error,
              message: state.error.errorMessage);
        } else if (state is SuccessLoginState) {
          Navigator.of(context).pop();
          CustomDialog.positiveButton(
              context: context,
              title: getTranslations(context).success,
              message: state.response.message,
              positiveOnClick: () =>
                  Navigator.of(context).pushReplacementNamed(Routes.homeRoute));
        }
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.blackColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: 68.h,
                right: 18.w,
                left: 18.w,
              ),
              child: Form(
                key: loginViewModel.formKey,
                child: Column(
                  children: [
                    Image.asset(
                      ImageAssets.appLogo,
                      height: 120.w,
                    ),

                    SizedBox(height: 68.h),

                    CustomTextField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      prefixIcon: SvgPicture.asset(SvgAssets.icEmail,
                          height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                      hintText: getTranslations(context).email,
                      controller: loginViewModel.emailController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return getTranslations(context).emailIsEmpty;
                        }
                        if (!ValidationUtils.isValidEmail(text)) {
                          return getTranslations(context).invalidEmail;
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 22.h),

                    CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      prefixIcon: SvgPicture.asset(SvgAssets.icPassword,
                          height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                      hintText: getTranslations(context).password,
                      obscureText: !showPassword,
                      suffixIcon: IconButton(
                        onPressed: togglePasswordVisibility,
                        icon: Icon(
                          showPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                      controller: loginViewModel.passwordController,
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
                    ),

                    SizedBox(height: 16.h),

                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(Routes.forgetRoute);
                        },
                        child: Text(
                          getTranslations(context).forgetPasswordQuestion,
                          style: getRegularStyle(
                              color: AppColors.orangeColor,
                              fontSize: FontSize.s14),
                        ),
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // Login Button
                    CustomizedElevatedButton(
                      onPressed: () {
                        loginViewModel.login();
                      },
                      text: getTranslations(context).login,
                      textStyle: getRegularStyle(
                          color: AppColors.blackColor, fontSize: 20),
                    ),

                    SizedBox(
                      height: 22.h,
                    ),

                    // Create Account RichText
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "${getTranslations(context).doNotHaveAccount} ",
                            style: getRegularStyle(fontSize: FontSize.s14),
                          ),
                          TextSpan(
                            text: getTranslations(context).createOne,
                            style: const TextStyle(
                              color: AppColors.orangeColor,
                              fontSize: FontSize.s14,
                              fontWeight: FontWeight.w900,
                              fontFamily: FontConstants.robotoFont,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to Create Account Screen
                                Navigator.of(context)
                                    .pushNamed(Routes.registerRoute);
                              },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 26.h),

                    // OR Divider
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.orangeColor,
                            indent: 70.w,
                            endIndent: 12.w,
                          ),
                        ),
                        Text(getTranslations(context).or,
                            style:
                                getRegularStyle(color: AppColors.orangeColor)),
                        Expanded(
                          child: Divider(
                            color: AppColors.orangeColor,
                            indent: 12.w,
                            endIndent: 70.w,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 28.h),

                    // Login with Google Button
                    CustomizedElevatedButton(
                      onPressed: (){
                        loginViewModel.loginWithGoogle();
                      },
                      prefixIcon: SvgPicture.asset(SvgAssets.icGoogle,
                          height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                      text: getTranslations(context).loginWithGoogle,
                      textStyle: getRegularStyle(color: AppColors.blackColor),
                    ),

                    SizedBox(height: 32.h),

                    LanguageSwitch(
                        currentLocale: context.read<LocaleCubit>().state,
                        onChanged: (Locale newLocale) {
                          context.read<LocaleCubit>().changeLocale(newLocale);
                        }),

                    SizedBox(height: 32.h),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



}
