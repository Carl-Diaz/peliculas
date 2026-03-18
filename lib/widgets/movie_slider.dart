import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.3,
      width: double.infinity,
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text('peliculas de dramas', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, ),),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_,index)=>_Movies()
              ))
        ],
      ),
      );
  }
}

class _Movies extends StatelessWidget {
  const _Movies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 130,
      //color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(
              context,
              '/details',
              arguments: 'movie-instance',
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/valverde.jpg'), 
                image: NetworkImage('https://picsum.photos/300/400'),
                fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: 10,),
          Text('Godzilla', style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          softWrap: true,)
        ],
      ),
    );
  }
}
