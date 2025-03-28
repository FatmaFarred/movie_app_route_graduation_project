import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/App_colors.dart';
import '../../../../core/resources/style_manager.dart';
import '../../../../di/di.dart';
import 'MovieSuggetionViewModel.dart';
import 'MovieSuggetionWidget.dart';
import 'Moviesuggetion States.dart';

class MovieSuggetionScreen extends StatefulWidget {
  final String movieId;

  const MovieSuggetionScreen({super.key, required this.movieId});

  @override
  State<MovieSuggetionScreen> createState() => _MovieSuggetionScreenState();
}

class _MovieSuggetionScreenState extends State<MovieSuggetionScreen> {
  late MovieSuggetionViewModel movieSuggetionViewModel;

  @override
  void initState() {
    super.initState();
    movieSuggetionViewModel = getIt<MovieSuggetionViewModel>();
    movieSuggetionViewModel.loadMovieSuggetion(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MovieSuggetionViewModel, MovieSuggetionState>(
        bloc: movieSuggetionViewModel,
        builder: (context, state) {
          if (state is LoadingSuggetionState) {
            return buildLoadingState(state);
          }

          if (state is ErrorSuggetionState) {
            return buildErrorState(state);
          }

          if (state is SuccessSuggetionState) {
            return buildSuccessState(state);
          }

          return Container();
        },
      ),
    );
  }

  Widget buildLoadingState(LoadingSuggetionState state) {
    return SizedBox(
      height: 200.h,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator(), Text("Loading")],
      ),
    );
  }

  Widget buildErrorState(ErrorSuggetionState state) {
    return SizedBox(
      height: 500.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.error.errorMessage ?? ""),
          TextButton(
            onPressed: () {}, // Retry logic
            child: Text(
              "Try again",
              style: getBoldStyle(color: AppColors.orangeColor),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSuccessState(SuccessSuggetionState state) {
    var suggetionlist = state.response?.data?.movies ?? [];
    if (kDebugMode) {
      print("Movies: $suggetionlist");
    }

    if (suggetionlist.isEmpty) {
      return const Center(child: Text("No movie suggestions available"));
    }

    return Column(
      children: [
        Container(
          padding: EdgeInsets.zero,
          margin: EdgeInsets.zero,
          height: 600.h,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              mainAxisExtent: 279.h,
            ),
            shrinkWrap: false,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: suggetionlist.length,
            itemBuilder: (context, index) {
              return Moviesuggetionwidget(
                movieid: "${suggetionlist[index].id ?? ""}",
                imagePath: suggetionlist[index].mediumCoverImage ?? "",
                title: "${suggetionlist[index].rating ?? ""}",
              );
            },
          ),
        ),
      ],
    );
  }

  void onErrorPressed() {
    movieSuggetionViewModel
        .loadMovieSuggetion(widget.movieId); // Retry the method
  }
}
