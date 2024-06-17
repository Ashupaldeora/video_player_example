import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../model/video_data.dart';

class HomeProvider extends ChangeNotifier {
  List<Movie> _movies = [];
  VideoPlayerController? videoController;
  ChewieController? chewieController;

  List<Movie> get movies => _movies;

  // Method to load movies from a JSON string
  Future<void> loadMovies() async {
    String jsonString = await rootBundle.loadString('assets/json/data.json');
    List<dynamic> jsonData = jsonDecode(jsonString);
    _movies = jsonData.map((item) => Movie.fromJson(item)).toList();
    notifyListeners();
  }

  HomeProvider() {
    _initialize();
  }
  setVideoPlayer(String url) async {
    videoController = VideoPlayerController.networkUrl(Uri.parse(url));
    await videoController!.initialize();
    notifyListeners();

    chewieController = ChewieController(
      videoPlayerController: videoController!,
      autoPlay: true,
    );
  }

  // Method to initialize the provider
  Future<void> _initialize() async {
    await loadMovies();
  }
}
