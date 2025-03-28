import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../../di/di.dart';
import '../../../../core/customized_widgets/reusable_widgets/custom_dialog.dart';
import '../../../../core/customized_widgets/reusable_widgets/custom_loading.dart';
import '../../../../core/customized_widgets/reusable_widgets/custom_text_field.dart';
import '../../../../core/customized_widgets/reusable_widgets/customized_card_item.dart';
import '../../../../core/resources/assets_manager.dart';
import 'cubit/search_cubit.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchCubit searchCubit = getIt<SearchCubit>();

  String currentSearchText = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding:
                            EdgeInsets.only(top: 21.h, right: 16.w, left: 16.w),
                        child: CustomTextField(
                          keyboardType: TextInputType.text,
                          prefixIcon: SvgPicture.asset(SvgAssets.icSearch,
                              height: 25.h, width: 25.h, fit: BoxFit.scaleDown),
                          hintText: getTranslations(context).search,
                          onFieldSubmitted: (search) {
                            if (search != null && search.trim().isNotEmpty) {
                              searchCubit.searchMovie(search);
                              currentSearchText = search;
                            }
                          },
                        ),
                      ),
                    )
                  ],
              body: BlocConsumer<SearchCubit, SearchState>(
                bloc: searchCubit,
                listener: (context, state) {
                  if (state is SearchErrorState) {
                    CustomDialog.positiveButton(
                        context: context,
                        title: getTranslations(context).error,
                        message: state.error.errorMessage,
                        positiveOnClick: () {
                          Navigator.pop(context);
                        });
                  }
                },
                builder: (context, state) {
                  if (state is SearchSuccessState) {
                    return NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                          searchCubit.searchMovie(currentSearchText,
                              isLoadMore: true);
                        }
                        return true;
                      },
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(
                              top: 21.h,
                              bottom: 100.h,
                              right: 16.w,
                              left: 16.w),
                          itemCount: state.searchList!.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 191.w / 279.h,
                                  mainAxisSpacing: 8.h,
                                  crossAxisSpacing: 16.w),
                          itemBuilder: (context, index) {
                            return CustomizedCardItem(
                              movie: state.searchList![index],
                            );
                          }),
                    );
                  }
                  if (state is SearchLoadingState) {
                    return const Center(child: CustomLoading());
                  }
                  return Center(
                    child: Image.asset(
                      ImageAssets.emptyImage,
                      width: 124.w,
                      height: 124.h,
                    ),
                  );
                },
              )),
        )
      ],
    );
  }
}
