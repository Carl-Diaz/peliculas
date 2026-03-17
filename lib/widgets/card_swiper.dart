import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/details');
      },
      child: SizedBox(
        height: size.height * 0.4,
        width: double.infinity,
        child: Swiper(
          pagination: SwiperPagination(),
          autoplay: true,
          itemCount: 8,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 1.0,
          itemHeight: size.height * 0.6,
          itemBuilder: (context, index) => FadeInImage(
            fit: BoxFit.cover,
            placeholder: AssetImage('assets/valverde.jpg'),
            image: NetworkImage(
              'https://platform.managingmadrid.com/wp-content/uploads/sites/103/2026/03/gettyimages-2266009518.jpg?quality=90&strip=all&crop=0.0050000000000026%2C0%2C99.99%2C100&w=2400',
              
            ),
          ),
        ),
      ),
    );
  }
}
