import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget{
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: AnimatedOpacity(
          opacity: 1.0,
          duration: Duration(microseconds: 500),
          child: Icon(
            Icons.music_note,
            color: Colors.red,
            size: 100.0,
          ),
         
          
        ),
      ),
    );
  }
}
