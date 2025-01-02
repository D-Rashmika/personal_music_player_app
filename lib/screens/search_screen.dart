import 'package:flutter/material.dart';
import 'playing_screen.dart'; // Import your PlayingScreen widget here

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Temporary placeholder list for search results
    final List<Map<String, String>> searchResults = [
      {"songName": "Song 1", "artistName": "Artist 1", "albumArtUrl": "https://via.placeholder.com/300"},
      {"songName": "Song 2", "artistName": "Artist 2", "albumArtUrl": "https://via.placeholder.com/300"},
      {"songName": "Song 3", "artistName": "Artist 3", "albumArtUrl": "https://via.placeholder.com/300"},
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Search Page",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar with TextField
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Icon(Icons.search, color: Colors.grey[400]),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: searchController,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "Search songs or artists",
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        // Handle search action here
                        print("Searching for: $value");
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Search Results List
            Expanded(
              child: searchResults.isNotEmpty
                  ? ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final song = searchResults[index];
                        return ListTile(
                          onTap: () {
                            // Navigate to PlayingScreen with song details
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlayingScreen(
                                  songName: song["songName"]!,
                                  artistName: song["artistName"]!,
                                  albumArtUrl: song["albumArtUrl"]!,
                                ),
                              ),
                            );
                          },
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(song["albumArtUrl"]!),
                          ),
                          title: Text(
                            song["songName"]!,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            song["artistName"]!,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        "No search results available",
                        style: TextStyle(color: Colors.grey[600], fontSize: 16),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
