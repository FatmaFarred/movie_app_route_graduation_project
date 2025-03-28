import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_route_graduation_project/core/resources/app_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/profile_page/cubit/profile_cubit.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/profile_page/widgets/profile_header.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../../core/resources/style_manager.dart';
import '../../../../di/di.dart';
import '../../../../core/customized_widgets/reusable_widgets/custom_dialog.dart';
import '../../../../core/customized_widgets/reusable_widgets/custom_loading.dart';
import '../../../../core/routes_manager/routes.dart';
import 'widgets/tab_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> avatarList = [
    ImageAssets.avatar1,
    ImageAssets.avatar2,
    ImageAssets.avatar3,
    ImageAssets.avatar4,
    ImageAssets.avatar5,
    ImageAssets.avatar6,
    ImageAssets.avatar7,
    ImageAssets.avatar8,
    ImageAssets.avatar9,
  ];

  final PageController pageController = PageController();
  int selectedIndex = 0;

  ProfileCubit profileCubit = getIt<ProfileCubit>();

  @override
  void initState() {
    super.initState();
    profileCubit.loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      bloc: profileCubit,
      listener: (context, state) {
        if (state is ProfileErrorState) {
          CustomDialog.positiveButton(
              context: context,
              title: getTranslations(context).error,
              message: state.error.errorMessage,
              positiveOnClick: () {
                Navigator.pop(context);
              });
        }
      },
      buildWhen: (context, state) {
        if (state is ProfileInitialState ||
            state is ProfileLoadingState ||
            state is ProfileSuccessState) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is ProfileInitialState || state is ProfileLoadingState) {
          return const CustomLoading();
        }
        if (state is ProfileSuccessState) {
          return buildProfileSection(state);
        }
        return const Scaffold();
      },
    );
  }

  Widget buildProfileSection(ProfileSuccessState state) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(
                color: AppColors.darkGrayColor,
                child: Column(
                  spacing: 20.h,
                  children: [
                    ProfileHeader(
                      name: state.profileData!.name!,
                      wishListCount: "${state.favoritesList?.length ?? 0}",
                      historyCount: "${state.historyList?.length ?? 0}",
                      avatarImage: avatarList[state.profileData!.avaterId!],
                      onEditButtonClick: updateProfile,
                      onExitButtonClick: logout,
                    ),
                    TabBar(
                        indicatorColor: AppColors.orangeColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        tabs: [
                          Column(
                            spacing: 8.h,
                            children: [
                              SvgPicture.asset(SvgAssets.icList),
                              Text(
                                getTranslations(context).watchList,
                                style: getRegularStyle(
                                    fontSize: 20, color: AppColors.whiteColor),
                              ),
                              const SizedBox()
                            ],
                          ),
                          Column(
                            spacing: 8.h,
                            children: [
                              SvgPicture.asset(SvgAssets.icFolder),
                              Text(
                                getTranslations(context).history,
                                style: getRegularStyle(
                                    fontSize: 20, color: AppColors.whiteColor),
                              ),
                              const SizedBox()
                            ],
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ],
          body: TabBarView(
            children: [
              TabPage(movieList: state.favoritesList),
              TabPage(movieList: state.historyList),
            ],
          ),
        ),
      ),
    );
  }

  void logout() {
    CustomDialog.positiveAndNegativeButton(
        context: context,
        title: getTranslations(context).warning,
        message: getTranslations(context).confirmLogout,
        positiveOnClick: () {
          profileCubit.logout(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginRoute,
            (route) => false,
          );
        },
        negativeOnClick: () {
          Navigator.pop(context);
        });
  }

  void updateProfile() {
    Navigator.pushNamed(context, Routes.updateProfileRoute);
  }
}
