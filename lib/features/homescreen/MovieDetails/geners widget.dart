import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/MovieDetailsScreenStates.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/MovieDetails/icon%20with%20text%20Container%20widget.dart';

class GenresWidget extends StatelessWidget {
  final SuccessState state;
  GenresWidget({required this.state});

  @override
  Widget build(BuildContext context) {
    var genresList = state.response?.data?.movie?.genres?? [];

    return Container(
      height: 200.h,

      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 16.w,
          mainAxisExtent: 36.h

        ),
        itemCount: genresList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return iconWithTextContainerWidget(
            title: genresList[index],
            height: 36.h,
          );
        },
      ),
    );
  }
}
