import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/dependency%20injection/Di.dart';
import 'package:movie_app_route_graduation_project/core/app_theme.dart';
import 'package:movie_app_route_graduation_project/core/bloc%20observer.dart';
import 'package:movie_app_route_graduation_project/features/auth/Reigster/Resister_Screen.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/home_screen.dart';


void main()  {
  configureDependencies();
  Bloc.observer=  MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize:  const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>MaterialApp(

          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeData,
        initialRoute:RegisterScreen.routeName ,
        routes: {Home_Screen.routeName:(context)=>Home_Screen(),
          RegisterScreen.routeName:(context)=>RegisterScreen(),
        },



      ),
    );

  }

}
