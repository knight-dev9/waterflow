import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final List<Widget> pages;

  const SplashPage({super.key, required this.pages});

  @override
  State<StatefulWidget> createState() {
    return _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: pageView,
    );
  }

  PageView get pageView {
    return PageView(
      physics: const BouncingScrollPhysics(),
      pageSnapping: true,
      reverse: false,
      children: widget.pages,
    );
  }
}