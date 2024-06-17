class Movie {
  String description;
  String sources;
  String subtitle;
  String thumb;
  String title;

  Movie({
    required this.description,
    required this.sources,
    required this.subtitle,
    required this.thumb,
    required this.title,
  });

  // Factory method to create a Movie instance from a JSON map
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      description: json['description'],
      sources: json['sources'],
      subtitle: json['subtitle'],
      thumb: json['thumb'],
      title: json['title'],
    );
  }
}
