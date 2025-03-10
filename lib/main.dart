import 'package:flutter/material.dart';
import 'package:waterflow/pages/splash_page.dart';
import 'package:waterflow/widgets/orange_love.dart';
import 'package:waterflow/widgets/scarlet_witch.dart';
import 'package:waterflow/widgets/xbox_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waterflow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(
        pages: [
          OrangeLove(),
          XboxController(),
          ScarletWitch(),
        ],
      ),
    );
  }
}
