import 'package:flutter/material.dart';

import 'package:fire_smoke/screan/splash_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Fire Classification',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
