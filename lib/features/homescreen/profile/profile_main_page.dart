import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/assets_manager.dart';
import 'package:movie_app_route_graduation_project/features/homescreen/profile/profile_widget.dart';

import '../../../core/utilis/App_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 52, horizontal: 24),
                height: 118,
                width: 118,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.avatar8),
                      fit: BoxFit.cover),
                ),
              ),
              ProfileNumpers(text: '12'),
              ProfileNumpers(text: '10'),
            ],
          ),
          Row(
            children: [
              ProfileText(text: 'John Safwat'),
              ProfileText(text: 'John Safwat'),
              ProfileText(text: 'John Safwat'),
            ],
          )
        ],
      ),
    );
  }
}
