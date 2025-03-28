import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'cubit/MovieDetailsScreenStates.dart';
import 'icon with text Container widget.dart';

class GenresWidget extends StatelessWidget {
  final SuccessState state;
  const GenresWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    var genresList = state.response?.data?.movie?.genres?? [];

    return SizedBox(
      height: 200.h,

      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8.h,
          crossAxisSpacing: 16.w,
          mainAxisExtent: 36.h

        ),
        itemCount: genresList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return IconWithTextContainerWidget(
            title: genresList[index],
            height: 36.h,
          );
        },
      ),
    );
  }
}
