import 'package:flutter/material.dart';
import 'package:social_media_app/pages/login_page.dart';
import 'package:social_media_app/theme/dark_mode.dart';
import 'package:social_media_app/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginPage(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}
