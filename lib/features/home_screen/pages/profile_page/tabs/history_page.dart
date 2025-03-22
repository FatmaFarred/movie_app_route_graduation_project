import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(ImageAssets.emptyImage),
        const Text("No History Yet"),
      ],
    );
  }
}
