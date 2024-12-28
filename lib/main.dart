import 'package:flutter/material.dart';
import 'package:personal_music_player_app/screens/splash_screen.dart';
import 'package:personal_music_player_app/screens/home_screen.dart';
import 'package:personal_music_player_app/screens/search_screen.dart';
import 'package:personal_music_player_app/app/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: AppRoutes.splash, // Set Splash Screen as the initial route
      onGenerateRoute: AppRoutes.generateRoute, // Use centralized routing
    );
  }
}
