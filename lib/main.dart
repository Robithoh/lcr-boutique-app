import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:uas_mobile/app/modules/login.dart';
import 'package:uas_mobile/app/modules/onBoardingView.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "LCR Boutique App",
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: const loginView(),
    );
  }
}
