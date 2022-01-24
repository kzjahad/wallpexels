// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:wallpaper_hub/views/home.dart';
import 'package:wallpaper_hub/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => SplashScreen()},
    );
  }
}
