import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieSuggetion/MovieSuggetionViewModel.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieSuggetion/MovieSuggetionWidget.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieSuggetion/Moviesuggetion%20States.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/icon%20with%20text%20Container%20widget.dart';

import '../../../../Api manager/dependency injection/Di.dart';
import '../../../../core/resources/App_colors.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/style manager.dart';
import '../screen shot widegt.dart';

class MovieSuggetionScreen extends StatefulWidget {

  @override
  State<MovieSuggetionScreen> createState() => _MovieSuggetionScreenState();
}

class _MovieSuggetionScreenState extends State<MovieSuggetionScreen> {
  late MovieSuggetionViewModel movieSuggetionViewModel;

  void initState() {
    super.initState();
    movieSuggetionViewModel =
        getIt<MovieSuggetionViewModel>(); // initialize here
    movieSuggetionViewModel.loadMovieSuggetion();
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<MovieSuggetionViewModel, MovieSuggetionState>(
        bloc: movieSuggetionViewModel,
        builder: (context, state) {
          if (state is LoadingSuggetionState) {
            return BuildLoadingState(state);
          }

          if (state is ErrorSuggetionState) {
            return BuildErrorState(state);
          }

          if (state is SuccessSuggetionState) {
            return BuildSuccessState(state);
          }

          return Container();
        },
      ),
    );
  }

  Widget BuildLoadingState(LoadingSuggetionState state) {
    return Container(height: 200.h,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator(),
          Text("Loading")
        ],),
    );
  }

  Widget BuildErrorState(ErrorSuggetionState state) {
    return Container(height: 500.h,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.error.errorMessage ?? ""),
          TextButton(
              onPressed: () => movieSuggetionViewModel.loadMovieSuggetion(),
              child: Text("Try again",
                style: getBoldStyle(color: AppColors.orangeColor),))
        ],),
    );
  }

  Widget BuildSuccessState(SuccessSuggetionState state) {
    var suggetionlist = state.response?.data?.movies ?? [];
    print("Movies: $suggetionlist");

    if (suggetionlist.isEmpty) {
      return Center(child: Text("No movie suggestions available"));
    }

    return Column(
      children: [
        Container(padding: EdgeInsets.zero,
          margin:EdgeInsets.zero ,
          height: 400.h,
          child: Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h
            
            
              ),
              shrinkWrap: false,
              padding: EdgeInsets.zero,
            
            
              physics: NeverScrollableScrollPhysics(),
              itemCount: suggetionlist.length,
              itemBuilder: (context, index) {
                return Moviesuggetionwidget(imagePath:suggetionlist[index]?.mediumCoverImage??"" , title: "${suggetionlist[index]?.rating ?? ""}");
              },
            ),
          ),
        ),
      ],
    );
  }




}
