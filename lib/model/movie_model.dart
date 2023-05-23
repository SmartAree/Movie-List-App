// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get_it/get_it.dart';
import 'package:watch_hour/model/app_config.dart';

class MovieModel {
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String posterPath;
  final String backDropPath;
  final num rating;
  final String releaseDate;
  MovieModel({
    required this.name,
    required this.language,
    required this.isAdult,
    required this.description,
    required this.posterPath,
    required this.backDropPath,
    required this.rating,
    required this.releaseDate,
  });

  MovieModel copyWith({
    String? name,
    String? language,
    bool? isAdult,
    String? description,
    String? posterPath,
    String? backDropPath,
    num? rating,
    String? releaseDate,
  }) {
    return MovieModel(
      name: name ?? this.name,
      language: language ?? this.language,
      isAdult: isAdult ?? this.isAdult,
      description: description ?? this.description,
      posterPath: posterPath ?? this.posterPath,
      backDropPath: backDropPath ?? this.backDropPath,
      rating: rating ?? this.rating,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'language': language,
      'isAdult': isAdult,
      'description': description,
      'posterPath': posterPath,
      'backDropPath': backDropPath,
      'rating': rating,
      'releaseDate': releaseDate,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      name: map['title'] as String,
      language: map['original_language'] as String,
      isAdult: map['adult'] as bool,
      description: map['overview'] as String,
      posterPath: map['poster_path'] as String,
      backDropPath: map['backdrop_path'] as String,
      rating: map['vote_average'] as num,
      releaseDate: map['release_date'] as String,
    );
  }

  String posterURL() {
    final AppConfig appConfig = GetIt.instance.get<AppConfig>();
    return "${appConfig.BASE_IMG_API_URL}$posterPath";
    //https://image.tmdb.org/t/p/original/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg
  }

  // String toJson() => json.encode(toMap());

  // factory MovieModel.fromJson(String source) =>
  //     MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  // @override
  // String toString() {
  //   return 'MovieModel(name: $name, language: $language, isAdult: $isAdult, description: $description, posterPath: $posterPath, backDropPath: $backDropPath, rating: $rating, releaseDate: $releaseDate)';
  // }

  // @override
  // bool operator ==(covariant MovieModel other) {
  //   if (identical(this, other)) return true;

  //   return other.name == name &&
  //       other.language == language &&
  //       other.isAdult == isAdult &&
  //       other.description == description &&
  //       other.posterPath == posterPath &&
  //       other.backDropPath == backDropPath &&
  //       other.rating == rating &&
  //       other.releaseDate == releaseDate;
  // }

  // @override
  // int get hashCode {
  //   return name.hashCode ^
  //       language.hashCode ^
  //       isAdult.hashCode ^
  //       description.hashCode ^
  //       posterPath.hashCode ^
  //       backDropPath.hashCode ^
  //       rating.hashCode ^
  //       releaseDate.hashCode;
  // }
}
