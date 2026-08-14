import 'package:flutter/material.dart';
import 'package:my_movie_app/models/movie_model.dart';
import 'package:my_movie_app/presentation/widgets/movie_widget.dart';
import 'package:my_movie_app/services/fetch_movie_service.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final service = FetchMovieService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ghibli movies app demo")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<MovieModel>>(
          future: service.fetchMovies(),
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              return ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: asyncSnapshot.data!.length,
                itemBuilder: (context, index) {
                  var movie = asyncSnapshot.data![index];
                  return MovieWidget(
                    title: movie.title,
                    rating: movie.rating,
                    imageUrl: movie.imageUrl,
                    director: movie.director,
                  );
                },
              );
            } else if (asyncSnapshot.hasError) {
              return Column(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${asyncSnapshot.error}'),
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
