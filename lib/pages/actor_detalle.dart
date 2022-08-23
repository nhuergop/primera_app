import 'package:flutter/material.dart';
import 'package:clase_3/models/actor_model.dart';
import 'package:clase_3/providers/actor_provider.dart';

import 'actor_listview.dart';

class ActorDetalle extends StatelessWidget {
  final int actor_id;

// no puede ser const pornque actorProvider es late
  ActorDetalle({Key? key, required this.actor_id}) : super(key: key);

  late final actorProvider = ActorProvider();

  @override
  Widget build(BuildContext context) {
    return _ActorFuture(
        context); // el build de ActorDetalle devuelve la funcion privada de _ActorFuture, que devuelve un FutureBuilder.
  }

  Widget _ActorFuture(BuildContext context) {
    return FutureBuilder(
      future: actorProvider.getActorData(actor_id), // llama a getActorData().
      builder: (BuildContext context, AsyncSnapshot<Actor> snapshot) {
        if (snapshot.hasData) {
          return actorListView(
              actorData: snapshot
                  .data!); // retorna actorListView, que recibe la data del resultado Future de future.
        } else {
          return const SizedBox(
              height: 500.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
