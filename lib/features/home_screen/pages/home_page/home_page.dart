import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Api manager/dependency injection/Di.dart';
import '../../../../core/customized widgets/reusable widgets/custom_dialog.dart';
import '../../../../core/customized widgets/reusable widgets/custom_loading.dart';
import '../../../../core/customized widgets/reusable widgets/customized_card_item.dart';
import '../../../../core/resources/App_colors.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/style manager.dart';
import '../../../../data/model/movie/movie_model.dart';
import '../../home_screen.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeCubit homeCubit = getIt<HomeCubit>();
  MovieModel? _selectedMovie;

  @override
  void initState() {
    super.initState();
    homeCubit.getCarouselMovies();
    homeCubit.getActionGenre("Action");
    homeCubit.getComedyGenre("Comedy");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => homeCubit,
      child: BlocConsumer<HomeCubit, HomePageState>(
        listener: (context, state) {
          if (state is HomePageErrorState) {
            CustomDialog.positiveButton(
              context: context,
              title: 'Error',
              message: state.error.errorMessage,
              positiveOnClick: () => Navigator.pop(context),
            );
          } else if (state is HomePageSuccessState) {
            if (_selectedMovie == null && state.carouselMovies.isNotEmpty) {
              setState(() {
                _selectedMovie = state.carouselMovies.first;
              });
            }
          }
        },
        builder: (context, state) {
          if (state is HomePageLoadingCarouselState ||
              state is HomePageLoadingGenreState) {
            return CustomLoading();
          } else if (state is HomePageSuccessState) {
            return _buildSuccessState(context, state);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildSuccessState(BuildContext context, HomePageSuccessState state) {
    return Stack(
      children: [
        if (_selectedMovie != null)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(_selectedMovie!.imageURL ?? ''),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.7),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
        SingleChildScrollView(
          child: Column(
            children: [
              _buildCarouselSection(context, state.carouselMovies),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    _buildCategoryHeader("Action"),
                    _buildHorizontalMovieList(state.genreActionMovies),
                    _buildCategoryHeader("Comedy"),
                    _buildHorizontalMovieList(state.genreComedyMovies),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getRegularStyle(
              fontSize: 18.sp,
              color:AppColors.whiteColor,
            ),
          ),
            GestureDetector(
              onTap: () {
                HomeScreen.homeScreenKey.currentState?.changeTab(2);
              },
              child: Text(
                "See More",
                style: getRegularStyle(
                  fontSize: 18.sp,
                  color: AppColors.orangeColor,
                ).copyWith(
                  decorationThickness: 2,
                  decorationColor: AppColors.orangeColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildCarouselSection(BuildContext context, List<MovieModel> movies) {
    if (movies.isEmpty) {
      return Center(
        child: CustomLoading()
      );
    }
    return Column(
      children: [
        Image.asset(ImageAssets.availableNowImage),
        SizedBox(
          height: 400.h,
          child: CarouselSlider.builder(
            itemCount: movies.length,
            options: CarouselOptions(
              height: 400.h,
              viewportFraction: 0.6,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _selectedMovie = movies[index];
                });
              },
            ),
            itemBuilder: (context, index, _) {
              return CustomizedCardItem(
                movie: movies[index],
              );
            },
          ),
        ),
        Image.asset(ImageAssets.watchNowImage),
      ],
    );
  }

  Widget _buildHorizontalMovieList(List<MovieModel> movies) {
    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: SizedBox(
              width: 150.w,
              child: CustomizedCardItem(
                movie: movies[index],
              ),
            ),
          );
        },
      ),
    );
  }
}