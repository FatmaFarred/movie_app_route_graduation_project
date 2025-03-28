import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_theme.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';
import 'package:movie_app_route_graduation_project/core/utils/prefs_manager.dart';
import 'package:movie_app_route_graduation_project/data/model/movie/movie_adapter.dart';
import 'package:movie_app_route_graduation_project/l10n/cubit/locale_cubit.dart';
import 'package:path_provider/path_provider.dart';

import 'di/di.dart';
import 'core/utils/bloc_observer.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  configureDependencies();
  Bloc.observer = MyBlocObserver();

  bool showOnboarding =
      await PrefsManager.getData(key: Routes.onBoardingRoute) ?? false;
  String? myToken =
      await PrefsManager.getData(key: AppConstants.prefsTokenKey) ?? "";

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(MovieAdapter());

  LocaleCubit localeCubit = LocaleCubit();
  await localeCubit.loadSavedLocale();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp(
    showOnboarding: showOnboarding,
    myToken: myToken,
    localeCubit: localeCubit,
  ));
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  bool showOnboarding;
  String? myToken;
  LocaleCubit localeCubit;

  MyApp({super.key,
    required this.showOnboarding,
    required this.myToken,
    required this.localeCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => localeCubit,
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => BlocBuilder<LocaleCubit, Locale>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: AppTheme.themeData,
              //initialRoute: Routes.loginRoute,
              initialRoute: showOnboarding == false
                  ? Routes.welcomeRoute
                  : (myToken == null ? Routes.loginRoute : Routes.homeRoute),
              onGenerateRoute: RouteGenerator.getRoute,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: state,
            );
          },
        ),
      ),
    );
  }
}
