import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 25, 25),
        title: Text('Rylix', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        
      ),
    );
  }
}
