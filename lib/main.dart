import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:video_player_example/screens/home/provider/home_provider.dart';
import 'package:video_player_example/screens/home/view/home_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
    ),
  ], builder: (context, child) => VideoPlayer()));
}

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
