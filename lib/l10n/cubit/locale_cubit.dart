import 'dart:io';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app_route_graduation_project/core/utils/prefs_manager.dart';

import '../../core/utils/app_constants.dart';

class LocaleCubit extends Cubit<Locale> {
  static const Locale fallBackLocale = Locale("en");

  LocaleCubit() : super(fallBackLocale);

  Future<void> loadSavedLocale() async {
    String? savedLocale =
        await PrefsManager.getData(key: AppConstants.prefsLanguageKey);

    if (savedLocale != null) {
      emit(Locale(savedLocale));
    } else {
      String systemLocale = Platform.localeName;
      if (AppLocalizations.supportedLocales.contains(Locale(systemLocale))) {
        emit(Locale(systemLocale));
      }
    }
  }

  Future<void> changeLocale(Locale newLocale) async {
    await PrefsManager.saveData(
        key: AppConstants.prefsLanguageKey, value: newLocale.languageCode);
    emit(newLocale);
  }
}
