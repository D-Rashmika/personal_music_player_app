import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = true; // Visibility flag for the music note icon
  int _blinkCount = 0; // To track how many times the icon has blinked

  @override
  void initState() {
    super.initState();

    // Timer to handle the blinking effect
    Timer.periodic(Duration(seconds: 1), (timer) { // Slow down the blink
      if (_blinkCount < 3) { // Blink 3 times
        setState(() {
          _isVisible = !_isVisible; // Toggle visibility
          _blinkCount++;
        });
      } else {
        timer.cancel(); // Stop blinking after 3 times
        // Navigate to home screen after the animation
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacementNamed(context, '/home');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,  // Black background
      body: Stack(
        children: [
          Center(
            child: AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0, // Make the icon blink
              duration: Duration(seconds: 1), // Slow down the blink animation
              child: Icon(
                Icons.music_note, // Music note icon
                color: Colors.red, // Red color for the music note
                size: 55.0, // Size of the music note
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Text(
              "Powered by Spotify",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
