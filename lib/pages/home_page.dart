import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> images = ['ticket_01.jpg', 'ticket_02.png'];
    // const bool kIsWeb = identical(0, 0.0);
    final Size _screen = MediaQuery.of(context).size;

    final SwiperPagination? pagination;
    final SwiperControl? control;

    if (kIsWeb) {
      pagination = SwiperPagination();
      control = SwiperControl();
    } else if (Platform.isAndroid || Platform.isIOS) {
      pagination = null;
      control = null;
    } else {
      pagination = SwiperPagination();
      control = SwiperControl();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('App de películas'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  'assets/images/${images[index]}',
                  fit: BoxFit.fill,
                );
              },
              indicatorLayout: PageIndicatorLayout.SCALE,
              // autoplay: true,
              // autoplayDelay: 1000,
              itemCount: images.length,
              pagination: pagination,
              control: control,
              fade: 1.0,
              viewportFraction: 0.85,
            ),
            height: (_screen.height) / 3,
            width: (_screen.width),
          ),
          Container(
            color: Colors.blue,
            height: 100.0,
            width: 400.0,
          ),
          Container(
            color: Colors.red,
            height: 100.0,
            width: 400.0,
          ),
        ],
      ),
    );
  }
}
