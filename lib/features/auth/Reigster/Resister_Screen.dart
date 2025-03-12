  import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movie_app_route_graduation_project/Api%20manager/dependency%20injection/Di.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/Customized%20Elevated%20bottom.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/Cutomized_Alert_Dialogue.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/custom_text_field.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/font_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/style%20manager.dart';
import 'package:movie_app_route_graduation_project/features/auth/Reigster/Avatar%20_widget.dart';
import 'package:movie_app_route_graduation_project/features/auth/Reigster/Register_cubit/register_state.dart';
import 'package:movie_app_route_graduation_project/features/auth/Reigster/Register_cubit/register_view_model.dart';
import 'package:movie_app_route_graduation_project/main.dart';




  class RegisterScreen extends StatefulWidget {

    static String routeName= "Register ";


  @override
    State<RegisterScreen> createState() => _RegisterScreenState();
  }

  class _RegisterScreenState extends State<RegisterScreen> {
   RegisterViewModel registerViewModel = getIt<RegisterViewModel>();
    // todo: savedvalue
  int selectedindex=0;

   bool ShowPassword=false;
    bool ShowConfirmPassword=false;


    List<dynamic> avatarPath =[ImageAssets.avatar1,
      ImageAssets.avatar2,
      ImageAssets.avatar3,
      ImageAssets.avatar4,
      ImageAssets.avatar5,
      ImageAssets.avatar6,
      ImageAssets.avatar7,
      ImageAssets.avatar8,
      ImageAssets.avatar9,

  ];


    @override
    Widget build(BuildContext context) {
      var height = MediaQuery.of(context).size.height;
      var width = MediaQuery.of(context).size.width;

      return BlocListener<RegisterViewModel,RegisterState>(
        bloc:registerViewModel ,
        listener: (context,state){
          if (state is LoadingRegisterState){
            Customizied_Alert_Dialogue.showLoading(context: context, message: "Loading");
          }else if(state is ErrorRegisterState) {
          Customizied_Alert_Dialogue.hideLoading(context: context);
          Customizied_Alert_Dialogue.showMessage(context: context, message: state.error.errorMessage??"",
          positiveActionButtonName: "OK ",title: "Error",positiveActionButton:  () => onPositiveAction(context));


          }else if (state is SuccessRegisterState){
            Customizied_Alert_Dialogue.hideLoading(context: context);
            Customizied_Alert_Dialogue.showMessage(context: context, message: "Register Successfully",
                positiveActionButtonName: "OK ",title: "Success",positiveActionButton:  () => onPositiveAction(context));

          }
        },

        child: Scaffold(
          appBar: AppBar(
            title: Text("register"),
        
          ),
          body:SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.04),
              child: Form(key: registerViewModel.formkey,
                child: Column(children: [
                   CarouselSlider.builder(itemCount: avatarPath.length,
                       itemBuilder: (context,index, itemIndex){
                     return  InkWell(onTap: (){
            
                     },
            
                         child: AvatarWidget(avatarPATH: avatarPath[index],));
                       },
                       options:CarouselOptions(enlargeCenterPage: true ,
                         initialPage: 0,
                         height: height*0.17,
                         disableCenter: true,
                         enlargeFactor: 0.6,
                         viewportFraction: 0.37,
                         onPageChanged: (index,changereson){
                         selectedindex=index;
                         registerViewModel.selectedAvater=selectedindex;
                         print("the selected index=$selectedindex");
                         print("the avatar is $registerViewModel.selectedAvater");
            
                           setState(() {
            
                         });
            
                         }
            
                       )
                   ),
                  SizedBox(height: height*0.01,),
                  Text("Avatar",style: getRegularStyle(color: AppColors.whiteColor)),
                    SizedBox(height: height*0.01),
            
                  CustomTextField(validator:(text){
                    if (text==null || text.trim().isEmpty){
                      return "* required please enter name";
                    }
            
                    else {
                      return null ;
                    }
            
                  },
                    keyBoardType: TextInputType.text,
                    prefixIcon: SvgPicture.asset(SvgAssets.icName,height: 25.h,width:25.h,fit: BoxFit.scaleDown),
                    hintText: 'Name',
                    controller: registerViewModel.nameController,
                  ),
            
                  SizedBox(height: height * 0.02),
                  CustomTextField(validator: (text){
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
                    keyBoardType: TextInputType.emailAddress,
                    prefixIcon: SvgPicture.asset(SvgAssets.icEmail,height: 25.h,width:25.h,fit: BoxFit.scaleDown),
                    hintText: 'Email',
                    controller: registerViewModel.emailController,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
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
                    prefixIcon: SvgPicture.asset(SvgAssets.icPassword,height: 25.h,width:25.h,fit: BoxFit.scaleDown),
                    hintText: 'Password',
            
                    suffixIcon: IconButton(
                      onPressed: (){
            
            
                        setState(() {
                          ShowPassword=!ShowPassword;
            
                        });
                      },
                      icon: Icon(
                        ShowPassword
                            ? Icons.visibility
                            : Icons.visibility_off_sharp,
                      ),
                    ),
                    obscureText: !ShowPassword,
                    controller: registerViewModel.passwordController,
                  ),
                  SizedBox(height: height * 0.02),
            
                  CustomTextField(validator: (text){
                    if (text==null || text.isEmpty){
                      return "* required please enter ConfirmPassword";
                    }
                    if (text!=registerViewModel.confirmpasswordController.text){
                      return "* ConfirmedPassword doesn't match the password";
            
                    }
                    return null ;
            
            
                  },
                    prefixIcon: SvgPicture.asset(SvgAssets.icPassword,height: 25.h,width:25.h,fit: BoxFit.scaleDown),
                    hintText: 'Confirm Password',
            
                    suffixIcon: IconButton(
                      onPressed: (){
            
            
                        setState(() {
                          ShowConfirmPassword=!ShowConfirmPassword;
            
                        });
                      },
                      icon: Icon(
                        ShowConfirmPassword
                            ? Icons.visibility
                            : Icons.visibility_off_sharp,
                      ),
                    ),
                    obscureText: !ShowConfirmPassword,
                    controller: registerViewModel.confirmpasswordController,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextField(validator: (text){
                    if (text==null || text.isEmpty){
                      return "* required please enter a valid Phone number";
                    }
                     final bool phoneValid = RegExp(r'^\+[2]{1}[0-9]{3,14}$').hasMatch(text);/// olny egypt code if not will replace [2] to [1_9]

                    if (!phoneValid){
                      return "* Phone number is invalid";
            
                    }
                    return null ;
            
            
                  },
            
                    keyBoardType: TextInputType.phone,
                    prefixIcon: SvgPicture.asset(SvgAssets.icPhone,height: 25.h,width:25.h,fit: BoxFit.scaleDown),
                    hintText: 'Phone Number',
                    controller: registerViewModel.phonenumberController,
                  ),
            
                  SizedBox(height: height * 0.02),
                    CustomeizedElevatedButtom(
                    onpressed:() {
                      registerViewModel.Register();
                    },
                    text: 'Create Account',
                      style:getRegularStyle(color: AppColors.blackColor,fontSize: 20) ,
                        
                  ),
            
                  SizedBox(height: height * 0.02),
            
                  // Create Account RichText
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Already Have Account ? ",
                          style: getRegularStyle(color: AppColors.whiteColor),
                        ),
                        TextSpan(
                          text: 'Login',
                          style: getBoldStyle(color: AppColors.orangeColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            //todo:Navigate to Create Account Screen


                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
            
            
                  Image.asset(ImageAssets.languageswitch)
            
            
            
            
            
            
            
            
                ],
            
            
                      ),
              ),
            ),
          ) ,
        
        
            ),
      );

  }
   void onPositiveAction (BuildContext context){

     Navigator.of(context).pop();
   }
}
