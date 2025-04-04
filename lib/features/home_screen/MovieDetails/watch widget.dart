import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_route_graduation_project/core/customized_widgets/reusable_widgets/customized_elevated_button.dart';
import 'package:movie_app_route_graduation_project/core/utils/prefs_manager.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/MovieDetails/webViewWidgetViewer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/resources/App_colors.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../l10n/app_translations.dart';
import 'Textwidget.dart';
import 'cubit/MovieDetailsScreenStates.dart';

class Playwidget extends StatefulWidget {
  SuccessState state;
  Function onWatchClick, onFavoriteClick;
  bool isFavorite;

  Playwidget(
      {super.key,
      required this.state,
      required this.onWatchClick,
      required this.isFavorite,
      required this.onFavoriteClick});

  @override
  State<Playwidget> createState() => _PlaywidgetState();
}

class _PlaywidgetState extends State<Playwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 645.h,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            fit: StackFit.expand,
            children: [
              // CachedNetworkImage as the background
              CachedNetworkImage(
                imageUrl:
                    widget.state.response?.data?.movie?.mediumCoverImage ?? "",
                imageBuilder: (context, imageProvider) => Container(
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          AppColors.lightBlackColor,
                          AppColors.blackColor
                        ])),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.blackColor,
                    backgroundColor: AppColors.whiteColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: AppColors.whiteColor,
                ),
              ),
              Positioned(
                top: 29.0.h,
                left: 16.0.w,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: AppColors.whiteColor,
                    size: 35,
                  ),
                ),
              ),
              Positioned(
                top: 29.0.h,
                right: 22.0.w,
                child: IconButton(
                  onPressed: () {
                    widget.onFavoriteClick();
                    setState(() {
                      widget.isFavorite = !widget.isFavorite;
                    });
                  },
                  icon: Icon(
                    widget.isFavorite
                        ? Icons.bookmark_outlined
                        : Icons.bookmark_outline,
                    color: AppColors.whiteColor,
                    size: 35,
                  ),
                ),
              ),
              Positioned(
                bottom: 305.h,
                left: 29.w,
                right: 29.w,
                child: Center(
                  child: Material(
                    color: Colors.transparent,
                    // Make the material background transparent
                    child: InkWell(
                      onTap: _launchTrailerUrl,
                      child: SvgPicture.asset(
                        SvgAssets.icPlay,
                        height: 87.h,
                        width: 87.w,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 66.h,
                left: 29.w,
                right: 29.w,
                child: Center(
                  child: TextWidget(
                    text:
                        widget.state.response?.data?.movie?.titleEnglish ?? "",
                    style:
                        getBoldStyle(color: AppColors.whiteColor, fontSize: 24),
                  ),
                ),
              ),
              Positioned(
                bottom: 10.h,
                left: 29.w,
                right: 29.w,
                child: Center(
                  child: TextWidget(
                    text: "${widget.state.response?.data?.movie?.year ?? ""}",
                    style: getBoldStyle(
                        color: AppColors.lightWhiteColor, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomizedElevatedButton(
            onPressed: () {
              widget.onWatchClick(widget.state);
            },
            text: getTranslations(context).watch,
            color: AppColors.redColor,
            textStyle: getBoldStyle(color: AppColors.whiteColor, fontSize: 20),
            borderColor: AppColors.redColor,
          ),
        ),
      ],
    );
  }

  Future<void> _launchTrailerUrl() async {
    var youtubeurl =
        "https://www.youtube.com/watch?v=${widget.state.response?.data?.movie?.ytTrailerCode}";
    final Uri url = Uri.parse(youtubeurl);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  void onWatchBotton() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MovieWebView(
            movieUrl: widget.state.response?.data?.movie?.url ?? "")));
    PrefsManager.saveData(
        key: "movieid", value: widget.state.response?.data?.movie?.id ?? "");
    if (kDebugMode) {
      print("the movie added to history");
    }
  }

  void onWatchButton1() async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MovieWebView(
        movieUrl: widget.state.response?.data?.movie?.url ?? "",
      ),
    ));

    var movie = widget.state.response?.data?.movie;

    if (movie != null) {
      var historyMovie = movie.toMovieModel();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String movieJson = jsonEncode(historyMovie.toJson());

      await prefs.setString('movie', movieJson);
      if (kDebugMode) {
        print("Movie saved to SharedPreferences");
      }
    }
  }
}
