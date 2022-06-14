class Actor {
  String? birthday;
  late String knownForDepartment;
  String? deathday;
  late int id;
  late String name;
  late List<String> alsoKnownAs;
  // late int gender;
  late String biography;
  late double popularity; // number = double
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
      // required this.gender,
      required this.biography,
      required this.popularity,
      this.placeOfBirth,
      this.profilePath,
      required this.adult,
      required this.imdbId,
      this.homepage});

  Actor.fromJsonMap(Map<String, dynamic> json) {
    birthday = json['bithday'];
    knownForDepartment = json['known_for_department'];
    deathday = json['deathday'];
    id = json['id'];
    name = json['name'];
    alsoKnownAs = json['also_known_as'];
    // gender = json['gender'];
    biography = json['biography'];
    popularity = json['popularity'];
    placeOfBirth = json['place_of_birth'];
    profilePath = json['profile_path'];
    adult = json['adult'];
    imdbId = json['imdb_id'];
    homepage = json['homepage'];
  }
}

class Actores {
  List<Actor> actores = [];

  Actores.fromJsonList(List<dynamic> jsonList) {
    for (var actor in jsonList) {
      final Actor actor_resultado = Actor.fromJsonMap(actor);
      actores.add(actor_resultado);
    }
  }
}
