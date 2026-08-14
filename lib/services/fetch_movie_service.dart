import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_movie_app/models/movie_model.dart';

class FetchMovieService {
  Future<List<MovieModel>> fetchMovies() async {
    var url = Uri.parse("https://ghibliapi.vercel.app/films");
    var response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final List<dynamic> data = jsonDecode(response.body);
      final mappedData = data.map((e) => MovieModel.fromJson(e)).toList();
      return mappedData;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
