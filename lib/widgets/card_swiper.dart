import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  final List image;
  const CardSwiper({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.5,
      width: double.infinity,
      child: Swiper(
        pagination: SwiperPagination(),
        autoplay: true,
        itemCount: image.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 1.0,
        itemHeight: size.height * 0.6,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "/details", arguments: 
            {"portada":"https://image.tmdb.org/t/p/w600_and_h900_face" +image[index]["backdrop_path"], 
            "movie_title":image[index]["title"],
            "original_title":image[index]["original_title"],
            "sinopsis":image[index]["overview"],
            "vote_average":image[index]["vote_average"],
            "results":image});
          },
          child: FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/valverde.jpg'),
            image: NetworkImage(
              "https://image.tmdb.org/t/p/w600_and_h900_face" +image[index]["backdrop_path"],
            ),
          ),
        ),
      ),
    );
  }
}
