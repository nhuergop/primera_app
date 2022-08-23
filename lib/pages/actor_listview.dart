import 'package:clase_3/pages/pelicula_detalle.dart';
import 'package:flutter/material.dart';

import '../models/actor_model.dart';

class actorListView extends StatelessWidget {
  late Actor actorData;
  actorListView({Key? key, required this.actorData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* actorListView recibe la data del actor y la ubica en los campos de la ListView como children. */
    return Scaffold(
        appBar: AppBar(
          title: Text(actorData.name),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            )
          ],
        ),
        body: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: SizedBox(
                    height: 300,
                    width: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FadeInImage(
                        image: actorData.getPicture(),
                        placeholder:
                            const AssetImage('assets/images/no-image.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Nombre: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: actorData.name,
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Fecha de nacimiento: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: actorData.getBirthDay(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Muerte: ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            children: [
                              TextSpan(
                                  text: actorData.getDeathDay(),
                                  style:
                                      TextStyle(fontWeight: FontWeight.normal)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(16),
              child: Text(actorData.biography, style: TextStyle(fontSize: 14)),
            ),
          ],
        ));
  }
}
