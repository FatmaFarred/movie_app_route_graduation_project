import 'package:flutter/material.dart';

import '../../../../core/resources/assets_manager.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageAssets.emptyImage),
        const Text("No Watchlist Yet"),
      ],
    );
  }
}
