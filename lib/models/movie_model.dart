class MovieModel {
  final String title;
  final String director;
  final String rating;
  final String? imageUrl;

  MovieModel({
    required this.title,
    required this.director,
    required this.rating,
    this.imageUrl,
  });

  MovieModel.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      rating = json['rt_score'],
      imageUrl = json['image'];
}
