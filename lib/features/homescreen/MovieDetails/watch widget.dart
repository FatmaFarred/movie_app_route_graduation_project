import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_route_graduation_project/core/customized_widgets/reusable_widgets/customized_elevated_button.dart';

import 'package:movie_app_route_graduation_project/core/utils/prefs_manager.dart';

import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/Textwidget.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/webViewWidgetViewer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../../core/resources/App_colors.dart';
import '../../../core/resources/assets_manager.dart';

import '../../../core/resources/style_manager.dart';

class Playwidget extends StatefulWidget {
  SuccessState state;
  Function OnWatchClick, onFavoriteClick;
  bool isFavorite;
  Playwidget({required this.state, required this.OnWatchClick, required this.isFavorite, required this.onFavoriteClick});

  @override
  State<Playwidget> createState() => _PlaywidgetState();
}

class _PlaywidgetState extends State<Playwidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 645.h,
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            fit: StackFit.expand,
            children: [
              // CachedNetworkImage as the background
              CachedNetworkImage(
                imageUrl: widget.state.response?.data?.movie
                    ?.mediumCoverImage ?? "",
                imageBuilder: (context, imageProvider) =>
                    Container(child: Container(decoration: BoxDecoration(
                        gradient: LinearGradient(begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,

                            colors: [
                              AppColors.lightBlackColor,
                              AppColors.blackColor
                            ])),),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                placeholder: (context, url) =>
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.blackColor,
                        backgroundColor: AppColors.whiteColor,
                      ),
                    ),
                errorWidget: (context, url, error) =>
                    Icon(
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
                  icon: Icon(
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
                  },
                  icon: Icon(
                    widget.isFavorite ? Icons.bookmark_outlined : Icons.bookmark_outline,
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
                    text: widget.state.response?.data?.movie?.titleEnglish ??
                        "",
                    style: getBoldStyle(
                        color: AppColors.whiteColor, fontSize: 24),
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
              widget.OnWatchClick(widget.state);
            },
            text: AppLocalizations.of(context)!.watch,
            color: AppColors.redColor,
            textStyle: getBoldStyle(color: AppColors.whiteColor, fontSize: 20),
            borderColor: AppColors.redColor,
          ),
        ),
      ],
    );
  }

  Future<void> _launchTrailerUrl() async {
    var youtubeurl = "https://www.youtube.com/watch?v=${widget.state?.response
        ?.data?.movie?.ytTrailerCode}";
    final Uri url = Uri.parse(youtubeurl);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  void OnWatchBotton() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            MovieWebView(
                movieUrl: widget.state?.response?.data?.movie?.url ?? "")));
    PrefsManager.saveData(
        key: "movieid", value: widget.state?.response?.data?.movie?.id ?? "");
    print("the movie added to history");
  }

  void OnWatchBotton1() async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) =>
          MovieWebView(
            movieUrl: widget.state?.response?.data?.movie?.url ?? "",
          ),
    ));

    var movie = widget.state?.response?.data?.movie;

    if (movie != null) {
      var historyMovie = movie.toMovieModel();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String movieJson = jsonEncode(historyMovie.toJson());

      await prefs.setString('movie', movieJson);
      print("Movie saved to SharedPreferences");
    }
  }
}
