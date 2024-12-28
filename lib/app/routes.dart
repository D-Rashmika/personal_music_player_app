import 'package:flutter/material.dart';
import 'package:personal_music_player_app/screens/splash_screen.dart';
import 'package:personal_music_player_app/screens/home_screen.dart';
import 'package:personal_music_player_app/screens/search_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String search = '/search';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case search:
        return MaterialPageRoute(builder: (_) => SearchScreen());
      default:
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
