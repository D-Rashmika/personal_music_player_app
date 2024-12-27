import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 28, 25, 25),
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            'Rylix',
            style: const TextStyle(color: Colors.white, fontSize: 25.0),
            textAlign: TextAlign.left,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 30.0),
            onPressed: () {
              // Search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recently Played Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recently Played',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Play All Recently Played
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 26, 23, 23),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Play All',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: screenHeight * 0.3, // Dynamic height based on screen
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey[800],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.music_note, color: Colors.white, size: 40.0),
                          SizedBox(height: 5.0),
                          Text('Song Name', style: TextStyle(color: Colors.white, fontSize: 14.0)),
                          Text('Artist Name', style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20.0),

              // Albums for You Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Albums for You',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Play All Albums
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 26, 23, 23),
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Play All',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                height: screenHeight * 0.4, // Dynamic height for larger album boxes
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    mainAxisExtent: 150.0, // Wider album boxes
                  ),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.grey[800],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.album, color: Colors.white, size: 50.0),
                          SizedBox(height: 5.0),
                          Text('Album Name', style: TextStyle(color: Colors.white, fontSize: 14.0)),
                          Text('Artist Name', style: TextStyle(color: Colors.grey, fontSize: 12.0)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
