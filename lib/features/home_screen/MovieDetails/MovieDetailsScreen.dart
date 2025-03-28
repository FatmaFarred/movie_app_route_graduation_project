import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/customized_widgets/reusable_widgets/custom_loading.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/MovieDetails/screen%20shot%20widegt.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/MovieDetails/watch%20widget.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/MovieDetails/webViewWidgetViewer.dart';

import '../../../core/resources/font_manager.dart';
import '../../../core/resources/style_manager.dart';
import '../../../di/di.dart';
import 'MovieSuggetion/MovieSuggetionScreen.dart';
import 'Textwidget.dart';
import 'cast widget.dart';
import 'cubit/MovieDetailsScreenStates.dart';
import 'cubit/MovieDetailsViewModel.dart';
import 'geners widget.dart';
import 'icon with text Container widget.dart';

class Moviedetailsscreen extends StatefulWidget {
  final String movieId;

  const Moviedetailsscreen({super.key, required this.movieId});

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
            return buildLoadingState(state);
          }

          if (state is ErrorState) {
            return buildErrorState(state);
          }

          if (state is SuccessState) {
            return buildSuccessState(state);
          }

          return Container();
        },
      ),
    );
  }

  Widget buildSuccessState(SuccessState state) {
    if (kDebugMode) {
      print("Movies: ${state.response?.data?.movie}");
    }
    var castlist = state.response?.data?.movie?.cast ?? [];
    if (kDebugMode) {
      print("watch: ${state.response?.data?.movie?.url}");
    }

    return Column(
      children: [
        Playwidget(
          state: state,
          onWatchClick: onWatchClick,
          isFavorite: movieDetailsViewModel.isFavorite,
          onFavoriteClick: () {
            var movieData = state.response?.data?.movie?.toMovieModel();
            if (movieDetailsViewModel.isFavorite) {
              movieDetailsViewModel
                  .removeFromFavorite(movieData?.movieId ?? "");
            } else {
              movieDetailsViewModel.addToFavorite(
                  movieData?.movieId ?? "",
                  movieData?.name ?? "",
                  movieData?.rating ?? 0,
                  movieData?.imageURL ?? "",
                  movieData?.year ?? "");
            }
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
                    IconWithTextContainerWidget(
                        imagePath: SvgAssets.icFavorite,
                        title:
                            "${state.response?.data?.movie?.likeCount ?? ""}"),
                    IconWithTextContainerWidget(
                        imagePath: SvgAssets.icRuntime,
                        title: "${state.response?.data?.movie?.runtime ?? ""}"),
                    IconWithTextContainerWidget(
                        imagePath: SvgAssets.icRate,
                        title: "${state.response?.data?.movie?.rating ?? ""}")
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
                    state.response?.data?.movie?.mediumScreenshotImage1 ?? "",
                height: 166.h,
              ),
              ScreenShotWidget(
                imagePath:
                    state.response?.data?.movie?.mediumScreenshotImage2 ?? "",
                height: 166.h,
              ),
              ScreenShotWidget(
                imagePath:
                    state.response?.data?.movie?.mediumScreenshotImage3 ?? "",
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
              SizedBox(
                height: 450.h,
                child: ListView.builder(
                    itemCount: castlist.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CastWidget(
                        imagePath: castlist[index].urlSmallImage ?? "",
                        name: castlist[index].name ?? "",
                        character: castlist[index].characterName ?? "",
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

  Widget buildLoadingState(LoadingState state) {
    return SizedBox(
      height: 932.h,
      child: const CustomLoading(),
    );
  }

  Widget buildErrorState(ErrorState state) {
    return SizedBox(
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
  void onErrorPressed() {
    movieDetailsViewModel
        .loadMovieDetailsScreen(widget.movieId); // Re-call the load method
  }

  void onWatchClick(SuccessState state) async {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MovieWebView(
        movieUrl: state.response?.data?.movie?.url ?? "",
      ),
    ));

    var movie = state.response?.data?.movie;

    if (movie != null) {
      var historyMovie = movie.toMovieModel();

      movieDetailsViewModel.addToHistory(historyMovie);
    }

    if (kDebugMode) {
      print("Movie saved to SharedPreferences");
    }
  }
}
