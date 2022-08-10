import 'package:flutter/material.dart';

import '../models/cast_model.dart';

class CastCard extends StatelessWidget {
  late final CastImage castImage;

  CastCard({Key? key, required this.castImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider actorImage = castImage.getActorImg();

    return Container(
      child: Image(image: actorImage),
    );
  }
}
