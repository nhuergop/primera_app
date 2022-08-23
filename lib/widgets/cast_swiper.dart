import 'dart:math';

import 'package:clase_3/models/actor_model.dart';
import 'package:clase_3/models/cast_model.dart';
import 'package:clase_3/models/pelicula_model.dart';
import 'package:clase_3/pages/actor_detalle.dart';
import 'package:clase_3/pages/pelicula_detalle.dart';
import 'package:clase_3/providers/cast_provider.dart';
import 'package:clase_3/providers/peliculas_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clase_3/pages/actor_detalle.dart';
import 'package:clase_3/models/actor_model.dart';

class CastSwiper extends StatelessWidget {
  final List<Cast> actores;

  CastSwiper({Key? key, required this.actores}) : super(key: key);

  /* CastSwiper recibe la lista de objetos Cast.
  Y ubica la data en cada campo, todo dentro de una ListView.builder. */
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: actores.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SizedBox(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: GestureDetector(
                        // si toco la imagen, me lleva al detalle del actor.
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ActorDetalle(
                                // me lleva a ActorDetalle, que recibe el id del actor.
                                actor_id: actores[index].id,
                              ),
                            ),
                          );
                        },
                        child: FadeInImage(
                            placeholder:
                                const AssetImage("assets/images/no-image.jpg"),
                            fit: BoxFit.cover,
                            width: 150,
                            image: actores[index]
                                .getActorImage()),
                      ),
                    ),
                  ),
                ),
                Text(actores[index].name),
                Text(actores[index].originalName)
              ],
            );
          }),
    );
  }
}
