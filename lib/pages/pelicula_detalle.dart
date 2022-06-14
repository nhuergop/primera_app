import 'package:clase_3/models/pelicula_model.dart';
import 'package:clase_3/widgets/tarjeta_pelicula.dart';
import 'package:flutter/material.dart';
import 'package:clase_3/widgets/tarjeta_pelicula.dart';

class PeliculaDetalle extends StatelessWidget {
  final Pelicula pelicula;

  const PeliculaDetalle({Key? key, required this.pelicula}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    String? poster = pelicula.posterPath;
    String? backDrop = pelicula.backdropPath;
    String placeholder = 'assets/images/no-image.jpg';

    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [
          Container(
            child: Image.network((backDrop != null) ? backDrop : placeholder),
            height: _screen.height / 3,
            width: _screen.width,
          ),
          Row(
            children: [
              Container(
                child: Image.network((poster != null) ? poster : placeholder),
                height: 400,
                width: 300,
              ),
              tarjeta_pelicula(pelicula: pelicula),
            ],
          ),
          Text(pelicula.overview)
        ]));
  }
}
