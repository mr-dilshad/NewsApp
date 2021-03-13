import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewHomeScreen extends StatefulWidget {
  final String url;
  WebViewHomeScreen({this.url});
  @override
  WebViewHomeScreenState createState() => WebViewHomeScreenState();
}

class WebViewHomeScreenState extends State<WebViewHomeScreen> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: widget.url,
    );
  }
}
