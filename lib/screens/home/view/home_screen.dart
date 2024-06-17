import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../movie_detail/view/movie_details.dart';
import '../model/video_data.dart';
import '../provider/home_provider.dart';
import 'components/categories.dart';
import 'components/movie_cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E2128),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        title: Text("Fire Player"),
        actions: [
          IconButton(
            icon: Icon(
              Icons.file_download_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Color(0xFF18191E),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search videos and songs',
                      hintStyle: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.w300,
                          fontSize: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(Icons.search, color: Colors.white),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SegmentedButtons(),
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
