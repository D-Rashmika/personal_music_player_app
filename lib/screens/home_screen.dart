import 'package:flutter/material.dart';
import 'package:personal_music_player_app/screens/playing_screen.dart';
import 'package:personal_music_player_app/screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void navigateToPlayingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PlayingScreen(songName: '', artistName: '', albumArtUrl: '',),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Rylix',
          style: TextStyle(color: Colors.white, fontSize: 25.0),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white, size: 30.0),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Recently Played Section
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  'Recently Played',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 260, // Adjusted height for spacing
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two rows
                    childAspectRatio: 1.1, // Adjusted box size
                    mainAxisSpacing: 15.0, // Space between boxes horizontally
                    crossAxisSpacing: 15.0, // Space between boxes vertically
                  ),
                  itemCount: 12, // 6 columns * 2 rows
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navigateToPlayingScreen(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800], // Placeholder background color
                          borderRadius: BorderRadius.circular(12.0), // Rounded edges
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0), // Padding inside the box
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.music_note, size: 40, color: Colors.white),
                              const SizedBox(height: 8),
                              const Text(
                                'Song Name',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Artist Name',
                                style: TextStyle(color: Colors.grey, fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Albums for You Section
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text(
                  'Albums for You',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ),
              SizedBox(
                height: 300, // Adjusted height for spacing
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Two rows
                    childAspectRatio: 1.0, // Adjusted box size
                    mainAxisSpacing: 20.0, // Space between boxes horizontally
                    crossAxisSpacing: 20.0, // Space between boxes vertically
                  ),
                  itemCount: 12, // 6 columns * 2 rows
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => navigateToPlayingScreen(context),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[800], // Placeholder background color
                          borderRadius: BorderRadius.circular(12.0), // Rounded edges
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0), // Padding inside the box
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.album, size: 50, color: Colors.white),
                              const SizedBox(height: 8),
                              const Text(
                                'Album Name',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                'Artist Name',
                                style: TextStyle(color: Colors.grey, fontSize: 10),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
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
