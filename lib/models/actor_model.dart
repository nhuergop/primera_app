import 'package:flutter/material.dart';

class Actor {
  String? birthday;
  late String knownForDepartment;
  String? deathday;
  late int id;
  late String name;
  late List<String> alsoKnownAs;
  late int gender;
  late String biography;
  late double popularity;
  String? placeOfBirth;
  String? profilePath;
  late bool adult;
  late String imdbId;
  String? homepage;

  Actor(
      {this.birthday,
      required this.knownForDepartment,
      this.deathday,
      required this.id,
      required this.name,
      required this.alsoKnownAs,
      required this.gender,
      required this.biography,
      required this.popularity,
      this.placeOfBirth,
      this.profilePath,
      required this.adult,
      required this.imdbId,
      this.homepage});

  Actor.fromJsonMap(Map<String, dynamic> json) {
    birthday = json['birthday'];
    //knownForDepartment = json['known_for_department'];
    deathday = json['deathday'];
    id = json['id'];
    name = json['name'];
    //alsoKnownAs = json['also_known_as'];
    gender = json['gender'];
    biography = json['biography'];
    // popularity = json['popularity'] / 1;
    // placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
    // adult = json['adult'];
    // imdbId = json['imdb_id'];
    //homepage = json['homepage'];
  }
  ImageProvider getPicture() {
    if (profilePath == null) {
      return const AssetImage('assets/images/no-image.png');
    } else {
      return NetworkImage('https://image.tmdb.org/t/p/w500/$profilePath');
    }
  }

  getGender() {
    if (gender == 2) {
      return "hombre";
    }
    if (gender == null) {
      return "";
    } else {
      return "mujer";
    }
  }

  getBirthDay() {
    if (birthday == null) {
      return "Desconocido";
    } else {
      return birthday;
    }
  }

  getDeathDay() {
    if (deathday == null) {
      return "--";
    } else {
      return deathday;
    }
  }
}
