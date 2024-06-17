import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player_example/screens/home/provider/home_provider.dart';
import 'package:video_player_example/screens/home/view/home_screen.dart';

import '../../home/model/video_data.dart';
import '../../home/view/components/movie_cards.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie});
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    HomeProvider homeProviderTrue =
        Provider.of<HomeProvider>(context, listen: true);
    HomeProvider homeProviderFalse =
        Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: Color(0xff1E2128),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          },
        ),
      ),
      body: Column(
        children: [
          homeProviderTrue.videoController != null &&
                  homeProviderTrue.chewieController != null &&
                  homeProviderTrue.videoController!.value.isInitialized
              ? Container(
                  height: 280,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: AspectRatio(
                    aspectRatio:
                        homeProviderTrue.videoController!.value.aspectRatio,
                    child: Chewie(
                      controller: homeProviderTrue.chewieController!,
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: const CircularProgressIndicator()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(color: Colors.white, fontSize: 23),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  movie.subtitle,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  movie.description,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<HomeProvider>(
              builder: (context, provider, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.movies.length,
                  itemBuilder: (context, index) {
                    final movie = provider.movies[index];
                    return GestureDetector(
                        onTap: () {
                          Provider.of<HomeProvider>(context, listen: false)
                              .setVideoPlayer(movie.sources);
                          print(movie.sources +
                              "-----------------------------------------------------------------------------------------------");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailScreen(movie: movie),
                            ),
                          );
                        },
                        child: MovieCard(movie: movie));
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
