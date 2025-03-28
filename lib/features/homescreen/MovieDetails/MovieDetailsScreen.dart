import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';

import 'package:movie_app_route_graduation_project/data/model/movie/movie_model.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsViewModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieSuggetion/MovieSuggetionScreen.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/Textwidget.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/cast%20widget.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/geners%20widget.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/icon%20with%20text%20Container%20widget.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/screen%20shot%20widegt.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/watch%20widget.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/webViewWidgetViewer.dart';

import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../di/di.dart';

class Moviedetailsscreen extends StatefulWidget {
  final String movieId;
  Moviedetailsscreen({required this.movieId});

  @override
  State<Moviedetailsscreen> createState() => _MoviedetailsscreenState();
}

class _MoviedetailsscreenState extends State<Moviedetailsscreen> {
  late MovieDetailsViewModel movieDetailsViewModel;

  @override
  void initState() {
    super.initState();
    movieDetailsViewModel = getIt<MovieDetailsViewModel>();
    movieDetailsViewModel.loadMovieDetailsScreen(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MovieDetailsViewModel, MovieDetailsScreenState>(
        bloc: movieDetailsViewModel,
        builder: (context, state) {
          if (state is LoadingState) {
            return BuildLoadingState(state);
          }

          if (state is ErrorState) {
            return BuildErrorState(state);
          }

          if (state is SuccessState) {
            return BuildSuccessState(state);
          }

          return Container();
        },
      ),
    );
  }

  Widget BuildSuccessState(SuccessState state) {
    print("Movies: ${state.response?.data?.movie}");
    var castlist = state.response?.data?.movie?.cast ?? [];
    print("watch: ${state.response?.data?.movie?.url}");

    return Column(
      children: [
        Playwidget(
          state: state,
          OnWatchClick: OnWatchClick,
          isFavorite: movieDetailsViewModel.isFavorite,
          onFavoriteClick: () {
            var movieData = state.response?.data?.movie?.toMovieModel();
            if (movieDetailsViewModel.isFavorite) {
              movieDetailsViewModel.removeFromFavorite(movieData?.movieId ?? "");
            }else{
              movieDetailsViewModel.addToFavorite(
                  movieData?.movieId ?? "",
                  movieData?.name ?? "",
                  movieData?.rating ?? 0,
                  movieData?.imageURL ?? "",
                  movieData?.year ?? "");
            }
            setState(() {

            });
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    iconWithTextContainerWidget(
                        imagePath: SvgAssets.icFavorite,
                        title:
                            "${state?.response?.data?.movie?.likeCount ?? ""}"),
                    iconWithTextContainerWidget(
                        imagePath: SvgAssets.icRuntime,
                        title:
                            "${state?.response?.data?.movie?.runtime ?? ""}"),
                    iconWithTextContainerWidget(
                        imagePath: SvgAssets.icRate,
                        title: "${state?.response?.data?.movie?.rating ?? ""}")
                  ],
                ),
              ),
              TextWidget(
                  text: AppLocalizations.of(context)!.screenShots,
                  style: getBoldStyle(
                      color: AppColors.whiteColor,
                      fontSize: 24,
                      fontFamily: FontConstants.robotoFont)),
              ScreenShotWidget(
                imagePath:
                    state?.response?.data?.movie?.mediumScreenshotImage1 ?? "",
                height: 166.h,
              ),
              ScreenShotWidget(
                imagePath:
                    state?.response?.data?.movie?.mediumScreenshotImage2 ?? "",
                height: 166.h,
              ),
              ScreenShotWidget(
                imagePath:
                    state?.response?.data?.movie?.mediumScreenshotImage3 ?? "",
                height: 166.h,
              ),
              SizedBox(height: 9.h),
              TextWidget(
                  text: AppLocalizations.of(context)!.similar,
                  style: getBoldStyle(
                      color: AppColors.whiteColor,
                      fontSize: 24,
                      fontFamily: FontConstants.robotoFont)),
              SizedBox(height: 9.h),
              MovieSuggetionScreen(
                movieId: widget.movieId,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.h, bottom: 16.h),
                child: TextWidget(
                  text: AppLocalizations.of(context)!.summary,
                  style: getBoldStyle(
                      color: AppColors.whiteColor,
                      fontSize: 24,
                      fontFamily: FontConstants.robotoFont),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: TextWidget(
                  text: state.response?.data?.movie?.descriptionFull ?? "",
                  style: getRegularStyle(
                      color: AppColors.whiteColor,
                      fontSize: 16,
                      fontFamily: FontConstants.robotoFont),
                ),
              ),
              TextWidget(
                text: AppLocalizations.of(context)!.cast,
                style: getBoldStyle(
                    color: AppColors.whiteColor,
                    fontSize: 24,
                    fontFamily: FontConstants.robotoFont),
              ),
              Container(
                height: 450.h,
                child: ListView.builder(
                    itemCount: castlist.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CastWidget(
                        imagePath: castlist![index].urlSmallImage ?? "",
                        name: castlist![index].name ?? "",
                        character: castlist![index].characterName ?? "",
                      );
                    }),
              ),
              TextWidget(
                text: AppLocalizations.of(context)!.genres,
                style: getBoldStyle(
                    color: AppColors.whiteColor,
                    fontSize: 24,
                    fontFamily: FontConstants.robotoFont),
              ),
              GenresWidget(state: state),
            ],
          ),
        ),
      ],
    );
  }

  Widget BuildLoadingState(LoadingState state) {
    return Container(
      height: 500.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator(), Text("Loading")],
      ),
    );
  }

  Widget BuildErrorState(ErrorState state) {
    return Container(
      height: 500.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.error.errorMessage ?? ""),
          TextButton(
            onPressed: () {}, // Calling retry logic here
            child: Text(
              "Try again",
              style: getBoldStyle(color: AppColors.orangeColor),
            ),
          )
        ],
      ),
    );
  }

  // Retry logic
  void OnErrorPressed() {
    movieDetailsViewModel
        .loadMovieDetailsScreen(widget.movieId); // Re-call the load method
  }

  void OnWatchClick(SuccessState state) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MovieWebView(
        movieUrl: state?.response?.data?.movie?.url ?? "",
      ),
    ));

    var movie = state?.response?.data?.movie;

    if (movie != null) {
      var historyMovie = movie.toMovieModel();

      String movieJson = jsonEncode(historyMovie.toJson());

      movieDetailsViewModel.addToHistory(historyMovie);
    }

    print("Movie saved to SharedPreferences");
  }
}
