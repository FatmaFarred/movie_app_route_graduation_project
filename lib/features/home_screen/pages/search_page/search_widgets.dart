
import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/App_colors.dart';
import 'package:movie_app_route_graduation_project/core/resources/style%20manager.dart';


Widget searchTextField(BuildContext context){
  return TextFormField(
      style: getBoldStyle(color: AppColors.whiteColor),
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search_rounded),
        labelStyle: Theme.of(context).textTheme.bodyLarge,
      ));
}
