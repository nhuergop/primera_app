import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/cast_model.dart';

class ActorProvider {
  String _apiKey =
      '4a183a779fb5b7a3ba8534533fc54648'; // la api key que te da la pagina cuando creas usuario
  String _language = 'es-ES';
  String _url = 'api.themoviedb.org';

  Future<List<Cast>> getActores(
    final int movie_id,
  ) async {
    // Uri() genera url
    // pasar protocolo, dominio, queries '?'
    // tenes que instalar libreria http en pub.yaml
    // buscala como http flutter, la 2da o 3era
    final Uri url = Uri.https(_url, '3/movie/${movie_id}/credits',
        {'api_key': _apiKey, 'language': _language});

    final respuesta = await http.get(url);
    final decodedData = json.decode(respuesta.body);
    final actores_list = Crew.fromJsonList(decodedData['cast']);
    return actores_list.actores;
  }

  Future<CastImage> getActorImage(final int actor_id) async {
    // Uri() genera url
    // pasar protocolo, dominio, queries '?'
    // tenes que instalar libreria http en pub.yaml
    // buscala como http flutter, la 2da o 3era
    final Uri url = Uri.https(_url, '3/people/${actor_id}/images',
        {'api_key': _apiKey, 'language': _language});

    final respuesta = await http.get(url);
    final decodedData = json.decode(respuesta.body);
    final actores_images = CastImage.fromJsonMap(decodedData['profiles']);
    return actores_images;
  }
}
