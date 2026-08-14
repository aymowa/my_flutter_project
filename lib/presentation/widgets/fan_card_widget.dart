import 'package:flutter/material.dart';
import 'package:my_movie_app/color_app.dart';

class FanCardWidget extends StatelessWidget {
  final String name;
  final int favoriteMoviesCount;
  final String imageUrl;

  const FanCardWidget({
    super.key,
    required this.favoriteMoviesCount,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 500,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: beige,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            Text("Fan name: $name"),
            Text("Favorite movies: $favoriteMoviesCount"),
            Image.network(
              height: 200.0,
              width: 100.0,
              imageUrl,
              errorBuilder: (context, exception, stackTrace) {
                return Text("This is an error in image");
              },
            ),
            ElevatedButton(onPressed: () {}, child: Text("Change image")),
          ],
        ),
      ),
    );
  }
}
