import 'package:flutter/material.dart';
import 'package:movie_app_route_graduation_project/core/resources/style%20manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/resources/App_colors.dart';

class MovieWebView extends StatelessWidget {
  String movieUrl;

  MovieWebView({required this. movieUrl});

  @override
  Widget build(BuildContext context) {

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse( movieUrl));

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          size: 30,
          color: AppColors.orangeColor,
        ),
        title: Text('Movie',
          style: getBoldStyle(color: AppColors.whiteColor)),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}