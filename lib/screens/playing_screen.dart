import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayingScreen extends StatefulWidget {
  final String songName;
  final String artistName;
  final String albumArtUrl;

  const PlayingScreen({super.key, 
    required this.songName,
    required this.artistName,
    required this.albumArtUrl,
  });

  @override
  _PlayingScreenState createState() => _PlayingScreenState();
}

class _PlayingScreenState extends State<PlayingScreen> {
  late AudioPlayer _audioPlayer;
  Duration _currentPosition = Duration.zero;
  Duration _songDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    try {
      await _audioPlayer.setUrl(
          "https://sample-music-url.com/song.mp3"); // Replace with the actual song URL
      _audioPlayer.durationStream.listen((duration) {
        setState(() {
          _songDuration = duration ?? Duration.zero;
        });
      });
      _audioPlayer.positionStream.listen((position) {
        setState(() {
          _currentPosition = position;
        });
      });
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  String _formatDuration(Duration duration) {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

    @override
  Widget build(BuildContext context) {
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
          "Playing Screen",
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: SingleChildScrollView( // Wrap Column in SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16), // Added padding for consistent spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              // Album Art
              Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.albumArtUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(height: 20),
              // Song Details
              Text(
                widget.songName,
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.artistName,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 30),
              // Music Player Controls
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Seek Bar
                    Slider(
                      value: _currentPosition.inSeconds.toDouble(),
                      max: _songDuration.inSeconds.toDouble(),
                      onChanged: (value) {
                        _audioPlayer.seek(Duration(seconds: value.toInt()));
                      },
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey[700],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_formatDuration(_currentPosition), style: TextStyle(color: Colors.grey)),
                        Text(_formatDuration(_songDuration), style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          icon: Icon(Icons.shuffle, color: Colors.grey),
                          onPressed: () {
                            // Implement shuffle functionality
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_previous, color: Colors.white),
                          onPressed: () {
                            // Skip to the previous song
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            _audioPlayer.playing ? Icons.pause_circle : Icons.play_circle_fill,
                            color: Colors.red,
                            size: 48,
                          ),
                          onPressed: () {
                            if (_audioPlayer.playing) {
                              _audioPlayer.pause();
                            } else {
                              _audioPlayer.play();
                            }
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.skip_next, color: Colors.white),
                          onPressed: () {
                            // Skip to the next song
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.repeat, color: Colors.grey),
                          onPressed: () {
                            // Implement repeat functionality
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Lyrics Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to lyrics screen or display lyrics
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                ),
                child: Text(
                  "LYRICS",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
