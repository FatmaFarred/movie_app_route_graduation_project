import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app_route_graduation_project/core/utils/app_constants.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/explore_page/cubit/explore_cubit.dart';

import '../../../../di/di.dart';
import '../../../../core/customized_widgets/reusable_widgets/custom_dialog.dart';
import '../../../../core/customized_widgets/reusable_widgets/custom_loading.dart';
import '../../../../core/customized_widgets/reusable_widgets/customized_card_item.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../l10n/app_translations.dart';
import 'explore_widgets.dart';

class ExplorePage extends StatefulWidget {
  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  ExploreCubit exploreCubit = getIt<ExploreCubit>();

  int genreIndex = 0;

  @override
  void initState() {
    super.initState();
    exploreCubit.getGenre(AppConstants.genresList[genreIndex]);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstants.genresList.length,
      child: SafeArea(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: TabBar(
                    labelPadding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                    indicatorPadding: EdgeInsets.symmetric(vertical: 8.h),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    unselectedLabelColor: AppColors.orangeColor,
                    labelColor: AppColors.blackColor,
                    dividerHeight: 0,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.orangeColor,
                    ),
                    tabs: AppConstants.genresList
                        .map((genre) => tabItem(genre))
                        .toList(),
                    onTap: (index) {
                      genreIndex = index;
                      exploreCubit.getGenre(AppConstants.genresList[index]);
                    },
                  ),
                ),
              ),
            ],
            body: BlocConsumer<ExploreCubit, ExploreState>(
              bloc: exploreCubit,
              listener: (context, state) {
                if (state is ExploreErrorState) {
                  CustomDialog.positiveButton(
                    context: context,
                    title: getTranslations(context).error,
                    message: state.error.errorMessage,
                    positiveOnClick: () {
                      Navigator.pop(context);
                    },
                  );
                }
              },
              builder: (context, state) {
                if (state is ExploreSuccessState) {
                  return NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        exploreCubit.getGenre(AppConstants.genresList[genreIndex],
                            isLoadMore: true);
                      }
                      return true;
                    },
                    child: GridView.builder(
                      padding: EdgeInsets.only(
                          top: 20.h, bottom: 100.h, right: 8.w, left: 8.w),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.moviesList!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 189.w / 279.h,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 8.h,
                      ),
                      itemBuilder: (context, index) {
                        return CustomizedCardItem(
                            movie: state.moviesList![index]);
                      },
                    ),
                  );
                }
                return const CustomLoading();
              },
            ),
          ),
        ),
      ),
    );
  }
}
