import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/dependency%20injection/Di.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsViewModel.dart';

import '../../../core/customized widgets/reusable widgets/Cutomized_Alert_Dialogue.dart';

class Moviedetailsscreen extends StatefulWidget {


  @override
  State<Moviedetailsscreen> createState() => _MoviedetailsscreenState();
}


class _MoviedetailsscreenState extends State<Moviedetailsscreen> {
  late MovieDetailsViewModel movieDetailsViewModel;

  @override
  void initState() {
    super.initState();
    movieDetailsViewModel = getIt<MovieDetailsViewModel>();  // initialize here
    movieDetailsViewModel.loadMovieDetailsScreen();
  }




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
    return Column(children: [Container(height: 150.h,
        child: Image.network(state.response?.data?.movie?.smallCoverImage??"")),
      Text(state.response?.data?.movie?.title??"")

    ],


    );
  }
  Widget BuildLoadingState(LoadingState state) {
    return Column(children: [
        Text("Loading" )
    ],);
  }
  Widget BuildErrorState(ErrorState state) {
    return Column(children: [
      Text(state.error.errorMessage??"" )
    ],);
  }


}
