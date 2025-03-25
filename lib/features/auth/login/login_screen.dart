
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/style%20manager.dart';
import 'package:movie_app_route_graduation_project/core/routes_manager/routes.dart';
import 'package:movie_app_route_graduation_project/core/shared_%20preferences.dart';


import '../../../Api manager/dependency injection/Di.dart';
import '../../../core/customized widgets/reusable widgets/Customized Elevated bottom.dart';
import '../../../core/customized widgets/reusable widgets/Cutomized_Alert_Dialogue.dart';
import '../../../core/customized widgets/reusable widgets/custom_text_field.dart';
import '../../../core/resources/App_colors.dart';
import '../Reigster/Resister_Screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login_cubit/Login_state.dart';
import 'login_cubit/login_view_model.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'Login_screen';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel loginViewModel =getIt<LoginViewModel>();
  bool showPassword = false;
  bool arabicIsSelected = false;




  void togglePasswordVisibility() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocListener<LoginViewModel,LoginState>(
     bloc: loginViewModel,
      listener: (context,state){
       if(state is LoadingLoginState){
         Customizied_Alert_Dialogue.showLoading(context: context, message: "Loading");
       }else if (state is ErrorLoginState){
         Customizied_Alert_Dialogue.hideLoading(context: context);
         Customizied_Alert_Dialogue.showMessage(context: context, message: state.error.errorMessage??"",
             positiveActionButtonName: "OK ",title: "Error",positiveActionButton:() => onPositiveAction(context) );
       }else if (state is SuccessLoginState){
         Customizied_Alert_Dialogue.hideLoading(context: context);
         Customizied_Alert_Dialogue.showMessage(context: context, message: "Login Successfully",
             positiveActionButtonName: "OK ",title: "Success",
           positiveActionButton: () => onPositiveAction(context)


        );
         Navigator.of(context).pushReplacementNamed(Routes.homeRoute);



       }
      },
      child: Scaffold(
        backgroundColor: AppColors.blackColor,

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: height * 0.015,
              vertical: height * 0.1,
            ),
            child: Form(key: loginViewModel.formkey,
              child: Column(
                children: [
                  Image.asset(
                    ImageAssets.appLogo,
                    height: height * 0.2,
                  ),

                  SizedBox(height: height * 0.02),

                  CustomTextField(
                    keyBoardType: TextInputType.emailAddress,
                    prefixIcon:  SvgPicture.asset(SvgAssets.icEmail,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: AppLocalizations.of(context)!.email,
                    controller: loginViewModel.emailController,
                    validator: (text){
                      if (text==null || text.isEmpty){
                        return "* required please enter the email";
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(text);
                      if (!emailValid){
                        return "* please enter valid email ";
                      }

                      return null ;

                    },
                  ),

                  SizedBox(height: height * 0.02),


                  CustomTextField(
                    prefixIcon: SvgPicture.asset(SvgAssets.icPassword,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    hintText: AppLocalizations.of(context)!.password,
                    obscureText: !showPassword,
                    suffixIcon: IconButton(
                      onPressed: togglePasswordVisibility,
                      icon: Icon(
                          showPassword
                            ? Icons.visibility
                            : Icons.visibility_off_sharp,
                      ),
                    ),
                    controller: loginViewModel.passwordController,
                    validator: (text){
                      if (text==null || text.isEmpty){
                        return "* required please enter password";
                      }
                      final bool passwordValid = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$%\^&\*\(\)_\+\-=<>?]).{8,}$')
                          .hasMatch(text);
                      if (!passwordValid){
                        return "* password is weak";
                      }

                      if (text.length<8){
                        return "* password should be 8 characters at least";
                      }
                      return null ;

                    },
                  ),


                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.forgetRoute);

                      },
                      child: Text(
                        AppLocalizations.of(context)!.forgetPassword,
                        style: getRegularStyle(color: AppColors.orangeColor),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.02),

                  // Login Button
                  CustomeizedElevatedButtom(
                    onpressed: () {
                      loginViewModel.login();
                      print('Login button pressed');


                    },
                    text: AppLocalizations.of(context)!.login,style: getRegularStyle(color: AppColors.blackColor,fontSize: 20),
                  ),

                  SizedBox(height: height * 0.02),

                  // Create Account RichText
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: AppLocalizations.of(context)!.doNotHaveAccount,
                          style: getRegularStyle(color: AppColors.whiteColor),
                        ),
                        TextSpan(
                          text: AppLocalizations.of(context)!.createOne,
                          style: getBoldStyle(color: AppColors.orangeColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Navigate to Create Account Screen
                              Navigator.of(context).pushNamed(Routes.registerRoute);
                            },
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  // OR Divider
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: AppColors.orangeColor,
                          indent: width * 0.18,
                          endIndent: width * 0.03,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: getRegularStyle(color: AppColors.orangeColor,fontSize:16 )
                      ),
                      Expanded(
                        child: Divider(
                          color: AppColors.orangeColor,
                          indent: width * 0.03,
                          endIndent: width * 0.18,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: height * 0.03),

                  // Login with Google Button
                  CustomeizedElevatedButtom(
                    onpressed: () {
                      // Add Google login logic here
                    },
                    prefixIcon: SvgPicture.asset(SvgAssets.icgoogle,
                        height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                    text: AppLocalizations.of(context)!.loginWithGoogle,style: getRegularStyle(color: AppColors.blackColor,fontSize: 16),
                  ),

                  SizedBox(height: height * 0.03),

                  InkWell(
                    onTap: (){
                      arabicIsSelected = false;
                      setState(() {

                      });
                    },
                    child: Image.asset(ImageAssets.languageswitch),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onPositiveClick ()async{


    String? token = await Shared_preferences.getData(key:"token");
    print("the token is $token&&");

  }
  void onPositiveAction(BuildContext context) {
    Navigator.of(context).pop();

  }
}
