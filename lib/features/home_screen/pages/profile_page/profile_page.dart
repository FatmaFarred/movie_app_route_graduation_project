import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_route_graduation_project/Api%20manager/dependency%20injection/Di.dart';
import 'package:movie_app_route_graduation_project/core/customized%20widgets/reusable%20widgets/custom_dialog.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/core/resources/style%20manager.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/profile_page/cubit/profile_cubit.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/profile_page/tabs/watchlist_page.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/profile_page/widgets/profile_header.dart';
import 'package:movie_app_route_graduation_project/l10n/app_translations.dart';

import '../../../../core/customized widgets/reusable widgets/custom_loading.dart';
import '../../../../core/routes_manager/routes.dart';
import 'tabs/history_page.dart';

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
      listener: (context, state) {},
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
          return CustomLoading();
        }
        if (state is ProfileSuccessState) {
          return buildProfileSection(state);
        }
        return const SizedBox();
      },
    );
  }

  Widget buildProfileSection(ProfileSuccessState state) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: Column(
        children: [
          Container(
            color: AppColors.darkGrayColor,
            child: Column(
              spacing: 20.h,
              children: [
                ProfileHeader(
                  name: state.profileData!.name!,
                  wishListCount: "${state.favoritesList?.length ?? 0}",
                  historyCount: '0',
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
                    ])
              ],
            ),
          ),
          Expanded(
              child: TabBarView(children: [
            state.favoritesList == null
                ? Center(
                    child: Image.asset(
                      ImageAssets.emptyImage,
                      width: 124.w,
                      height: 124.h,
                    ),
                  )
                : WatchlistPage(
                    favoriteList: state.favoritesList!,
                  ),
            HistoryPage()
          ]))
        ],
      )),
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
