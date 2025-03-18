import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/app_theme.dart';
import 'package:movie_app_route_graduation_project/core/shared_%20preferences.dart';

import 'Api manager/dependency injection/Di.dart';
import 'core/bloc observer.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main()  async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  bool showOnboarding = await Shared_preferences.getData(key: Routes.onBoardingRoute)??false ;
  print("the result is $showOnboarding");
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  Bloc.observer=  MyBlocObserver();
  runApp(MyApp(showOnboarding:showOnboarding ,));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  bool showOnboarding ;
  MyApp ({required this.showOnboarding});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        initialRoute: showOnboarding==false?Routes.onBoardingRoute:Routes.loginRoute,
        onGenerateRoute: RouteGenerator.getRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
      ),
    );
  }
}
