import 'package:clase_3/providers/actor_provider.dart';
import 'package:clase_3/widgets/cast_card.dart';
import 'package:flutter/material.dart';
import 'package:clase_3/models/cast_model.dart';

class CastSwiper extends StatelessWidget {
  late final List<Cast> castInfo;
  late final actorImage = ActorProvider();

  CastSwiper({Key? key, required this.castInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: castInfo.length,
      itemBuilder: (BuildContext context, int index) {
        return Center(child: Text(castInfo[index].name));
      },
    );
  }

  Widget _castImage(BuildContext context, int id) {
    return FutureBuilder(
      future: actorImage.getActorImage(id),
      builder: (BuildContext context, AsyncSnapshot<CastImage> snapshot) {
        if (snapshot.hasData) {
          return CastCard(
            castImage: snapshot.data!,
          );
        } else {
          return const SizedBox(
              height: 500.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
