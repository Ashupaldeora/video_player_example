import 'package:flutter/material.dart';

import '../../model/video_data.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  MovieCard({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF2C2C2E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(movie.thumb))),
                ),
                SizedBox(width: 26),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        movie.subtitle,
                        style: TextStyle(color: Colors.white54),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionButton(label: "MP3"),
                          ActionButton(label: "MP4"),
                          ActionButton(label: "CALL"),
                          ActionButton(label: "+"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final String label;

  ActionButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
      margin: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        color: Color(0xFF3A3A3C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
