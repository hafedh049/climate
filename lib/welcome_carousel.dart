import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:word_weather/location.dart';

class WelcomeCarousel extends StatefulWidget {
  const WelcomeCarousel({super.key});

  @override
  State<WelcomeCarousel> createState() => _WelcomeCarouselState();
}

class _WelcomeCarouselState extends State<WelcomeCarousel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: CarouselSlider.builder(
          itemCount: 4,
          options: CarouselOptions(viewportFraction: 1, height: MediaQuery.sizeOf(context).height, enableInfiniteScroll: false, autoPlayCurve: Curves.easeIn, enlargeFactor: 0),
          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
            return const Location();
          },
        ),
      ),
    );
  }
}
