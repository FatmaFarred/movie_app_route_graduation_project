import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/resources/app_colors.dart';

class LanguageSwitch extends StatelessWidget {
  Locale currentLocale;

  Function onChanged;

  LanguageSwitch({super.key, required this.currentLocale, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AnimatedToggleSwitch<Locale>.rollingByHeight(
        height: 45.h,
        spacing: .4.w,
        borderWidth: 2.r,
        current: currentLocale,
        values: AppLocalizations.supportedLocales.reversed.toList(),
        style: const ToggleStyle(
            backgroundColor: Colors.transparent,
            indicatorColor: AppColors.orangeColor,
            borderColor: AppColors.orangeColor),
        onChanged: (newLocale) {
          Future.delayed(const Duration(microseconds: 500), () {
            onChanged(newLocale);
          });
        },
        iconBuilder: (value, foreground) {
          if (value.languageCode == "en") {
            return SvgPicture.asset(SvgAssets.icSwitchEnglish);
          } else {
            return SvgPicture.asset(SvgAssets.icSwitchArabic);
          }
        },
      ),
    );
  }
}
