import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/features/home_screen/pages/search_page/search_widgets.dart';

import '../../../../core/resources/assets_manager.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            searchTextField(context),
            Expanded(
              child: Center(
                child: Image.asset(ImageAssets.emptyImage),
              ),
            )
          ],
        ),
      ),
    );
  }
}
