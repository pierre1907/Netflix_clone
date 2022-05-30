

import 'package:clone_netflix/services/api.dart';

class Movie {
  final int id;
  final String name;
  final String description;
  final String? posterPath;
  final List<String>? genres;
  final String? releaseDate;
  final double? vote;
  final List<String>? videos;


  Movie({
    required this.id,
    required this.name,
    required this.description,
    this.posterPath,
    this.genres,
    this.releaseDate,
    this.vote,
    this.videos
  });


  Movie copyWith({
    int? id,
    String? name,
    String? description,
    String? posterPath,
    List<String>? genres,
    String? releaseDate,
    double? vote,
    List<String>? videos
  }) {
    return Movie(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      posterPath: posterPath ?? this.posterPath,
      genres: genres ?? this.genres,
      releaseDate: releaseDate ?? this.releaseDate,
      vote: vote ?? this.vote,
      videos: videos ?? this.videos,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
    if (posterPath != null) {
      result.addAll({'posterPath': posterPath});
    }

    return result;
  }

  factory Movie.fromJson(Map<String, dynamic> map) {
    return Movie(
      id: map['id']?.toInt() ?? 0,
      name: map['title'] ?? '',
      description: map['overview'] ?? '',
      posterPath: map['poster_path'],
    );
  }

  String posterUrl(){
    Api api= Api();
    return api.baseImageUrl + posterPath!;
  }

  String reformatGenrens() {
    return genres!.reduce((String value, String element) => '$value ,$element');
  }


}
