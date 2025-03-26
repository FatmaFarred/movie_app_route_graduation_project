import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movie_app_route_graduation_project/core/app_theme.dart';
import 'package:movie_app_route_graduation_project/core/shared_%20preferences.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_adapter.dart';
import 'package:path_provider/path_provider.dart';

import 'Api manager/dependency injection/Di.dart';
import 'core/bloc observer.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main()  async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  bool showOnboarding = await Shared_preferences.getData(key: Routes.onBoardingRoute)??false ;
  String? Mytoken = await Shared_preferences.getData(key: "token")?? null;

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MovieAdapter());

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  configureDependencies();
  Bloc.observer=  MyBlocObserver();
  runApp(MyApp(showOnboarding:showOnboarding ,Mytoken: Mytoken));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  bool showOnboarding ;
  String? Mytoken;
  MyApp ({required this.showOnboarding, required this.Mytoken});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:  const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        initialRoute: Routes.homeRoute,
        //initialRoute: showOnboarding==false?Routes.onBoardingRoute:(Mytoken==null?Routes.loginRoute:Routes.homeRoute),
        onGenerateRoute: RouteGenerator.getRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('en'),
      ),
    );
  }
}
