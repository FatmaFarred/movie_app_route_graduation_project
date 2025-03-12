import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/app_theme.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/home_screen.dart';


void main()  {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
      initialRoute:Home_Screen.routeName ,
      routes: {Home_Screen.routeName:(context)=>Home_Screen()},



    );

  }

}
