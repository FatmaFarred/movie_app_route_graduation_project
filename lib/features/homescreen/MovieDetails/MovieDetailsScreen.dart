import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/dependency%20injection/Di.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/Customized%20Elevated%20bottom.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/style%20manager.dart';
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
import 'package:video_player/video_player.dart';

import '../../../core/customized widgets/reusable widgets/Cutomized_Alert_Dialogue.dart';
import '../../../core/resources/font_manager.dart';

class Moviedetailsscreen extends StatefulWidget {


  @override
  State<Moviedetailsscreen> createState() => _MoviedetailsscreenState();
}


class _MoviedetailsscreenState extends State<Moviedetailsscreen> {
  late MovieDetailsViewModel movieDetailsViewModel;



  @override
  void initState() {
    super.initState();

    movieDetailsViewModel = getIt<MovieDetailsViewModel>();

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
    print("Movies: ${state.response?.data?.movie}");
    var castlist= state.response?.data?.movie?.cast??[];
    print("watch: ${state.response?.data?.movie?.url}");



    return Column(
      children: [
        Playwidget(state: state),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:16.w),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h,bottom: 16.h),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [iconWithTextContainerWidget(imagePath: SvgAssets.icFavorite, title: "${state?.response?.data?.movie?.likeCount ?? ""}"),
                    iconWithTextContainerWidget(imagePath: SvgAssets.icRuntime, title: "${state?.response?.data?.movie?.runtime ?? ""}"),
                    iconWithTextContainerWidget(imagePath: SvgAssets.icRate, title: "${state?.response?.data?.movie?.rating ?? ""}")],),
                ),
                Text(AppLocalizations.of(context)!.screenShots,style: getBoldStyle(color: AppColors.whiteColor,fontSize: 24,fontFamily:FontConstants.robotoFont )),
                  ScreenShotWidget(imagePath: state?.response?.data?.movie?.mediumScreenshotImage1??"",height:166.h ,),
                  ScreenShotWidget(imagePath: state?.response?.data?.movie?.mediumScreenshotImage2??"",height:166.h),
                  ScreenShotWidget(imagePath: state?.response?.data?.movie?.mediumScreenshotImage3??"",height:166.h),
                  SizedBox(height:9.h ,),
                  TextWidget(text: AppLocalizations.of(context)!.similar,style: getBoldStyle(color: AppColors.whiteColor,fontSize: 24,fontFamily:FontConstants.robotoFont )),

                  SizedBox(height:9.h ,),
                  MovieSuggetionScreen(),
                  Padding(
                    padding:  EdgeInsets.only(top: 16.h,bottom: 16.h),
                    child: Text(AppLocalizations.of(context)!.summary,style: getBoldStyle(color: AppColors.whiteColor,fontSize: 24,fontFamily:FontConstants.robotoFont ),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Text(state.response?.data?.movie?.descriptionFull??"",style: getRegularStyle(color: AppColors.whiteColor,fontSize: 16,fontFamily:FontConstants.robotoFont ),),
                  ),
                  Text(AppLocalizations.of(context)!.cast,style: getBoldStyle(color: AppColors.whiteColor,fontSize: 24,fontFamily:FontConstants.robotoFont ),),
                  Container(height: 450.h,


                    child: ListView.builder(itemCount: castlist.length,
                        physics: NeverScrollableScrollPhysics(),

                        itemBuilder: (context,index){
                      return   CastWidget(imagePath: castlist![index].urlSmallImage??"", Name: castlist![index].name??"", character: castlist![index].characterName??"");

                    }),
                  ),
                  Text(AppLocalizations.of(context)!.genres,style: getBoldStyle(color: AppColors.whiteColor,fontSize: 24,fontFamily:FontConstants.robotoFont ),),
                  GenresWidget(state: state,),






                ],),
            )

      ],
    );
  }


  Widget BuildLoadingState(LoadingState state) {
    return Container(height:  500.h,
      child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [CircularProgressIndicator(),
        Text("Loading" )
      ],),
    );
  }
  Widget BuildErrorState(ErrorState state) {
    return Container(height: 500.h,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(state.error.errorMessage??"" ),
       TextButton(onPressed: ()=>movieDetailsViewModel.loadMovieDetailsScreen(), child: Text("Try again",style: getBoldStyle(color: AppColors.orangeColor),))
      ],),
    );
  }




}