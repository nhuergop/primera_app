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
