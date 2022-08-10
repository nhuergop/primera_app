import 'package:flutter/material.dart';

class Cast {
  late bool adult;
  int? gender;
  late int id;
  late String knownForDepartment;
  late String name;
  late String originalName;
  late int popularity;
  String? profilePath;
  late int castId;
  late String character;
  late String creditId;
  late int order;

  Cast(
      {required this.adult,
      this.gender,
      required this.id,
      required this.knownForDepartment,
      required this.name,
      required this.originalName,
      required this.popularity,
      this.profilePath,
      required this.castId,
      required this.character,
      required this.creditId,
      required this.order});

  Cast.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['knwon_for_department'];
    name = json['name'];
    originalName = json['original_name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  } // Cast
}

class Crew {
  List<Cast> actores = [];

  Crew.fromJsonList(List<dynamic> jsonList) {
    for (var actor in jsonList) {
      final Cast actor_resultado = Cast.fromJsonMap(actor);
      actores.add(actor_resultado);
    }
  }
}

class CastImage {
  late String filePath;

  CastImage({required this.filePath});

  CastImage.fromJsonMap(Map<String, dynamic> json) {
    filePath = json['file_path'];
  }

  ImageProvider getActorImg() {
    if (filePath == null) {
      return const AssetImage('assets/images/no-image.jpg');
    } else {
      return NetworkImage('https://image.tmdb.org/t/p/w500/$filePath');
    }
  }
}
