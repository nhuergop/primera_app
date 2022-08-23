import 'package:clase_3/models/cast_model.dart';
import 'package:clase_3/models/pelicula_model.dart';
import 'package:clase_3/providers/actor_provider.dart';
import 'package:clase_3/widgets/cast_swiper.dart';
import 'package:clase_3/widgets/tarjeta_pelicula.dart';
import 'package:flutter/material.dart';
import 'package:clase_3/widgets/tarjeta_pelicula.dart';

class PeliculaDetalle extends StatelessWidget {
  late final actorProvider = ActorProvider();
  final Pelicula pelicula;

  PeliculaDetalle({Key? key, required this.pelicula}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _screen = MediaQuery.of(context).size;
    ImageProvider poster = pelicula.getPosterImg();
    ImageProvider backDrop = pelicula.getBackDropImg();
    String placeholder = 'assets/images/no-image.jpg';

    return Scaffold(
        appBar: AppBar(),
        body: ListView(children: [
          Container(
            child: Image(image: poster),
            height: _screen.height / 3,
            width: _screen.width,
          ),
          Row(
            children: [
              Container(
                child: Image(image: backDrop),
                height: 400,
                width: 300,
              ),
              tarjeta_pelicula(pelicula: pelicula),
            ],
          ),
          Text(pelicula.overview),
          _swiperCast(context)
        ]));
  }

/* Empiezo en pelicula_detalle.dart.
  El FutureBuilder se construye cuando recibe el resultado de un Future.
  Necesita dos propiedades: future y builder.
  future recibe la llamada de la función asíncrona que devuelve un Future, en este caso, actorProvider.getActores().
  builder recibe una función que toma dos parámetros: context y snapshot.
  snapshot es un AsyncSnapshot.
  AsyncSnapshot, según la doc, es una representación inmutable de la interacción más reciente con una computación asíncrona.
  En este caso, AsyncSnapshot representa una lista de objetos Cast.
  El FutureBuilder returna un CastSwiper, que recibe la lista de objetos Cast, si la propiedad de hasData de snapshot es true.
  Si es false, retorna el progress indicator. */
  Widget _swiperCast(BuildContext context) {
    return FutureBuilder(
      future: actorProvider.getActores(pelicula.id),
      builder: (BuildContext context, AsyncSnapshot<List<Cast>> snapshot) {
        if (snapshot.hasData) {
          return CastSwiper(actores: snapshot.data!);
        } else {
          return const SizedBox(
              height: 500.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
