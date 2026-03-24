import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MovieSlider extends StatelessWidget {
  final List dataMovie;
  MovieSlider({super.key, required this.dataMovie});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      width: double.infinity,
      //color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(10)),
          Text(
            'peliculas de dramas',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/details",
                    arguments: {
                      "portada":
                          "https://image.tmdb.org/t/p/w600_and_h900_face" +
                          dataMovie[index]["backdrop_path"],
                      "movie_title": dataMovie[index]["title"],
                      "original_title": dataMovie[index]["original_title"],
                      "sinopsis": dataMovie[index]["overview"],
                      "vote_average": dataMovie[index]["vote_average"],
                    },
                  );
                },
                child: _Movies(
                  imagen: dataMovie[index]["poster_path"],
                  titulo: dataMovie[index]["title"],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Movies extends StatelessWidget {
  final String titulo;
  final String imagen;
  _Movies({super.key, required this.titulo, required this.imagen});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 130,
      //color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/valverde.jpg'),
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w600_and_h900_face" + imagen,
              ),
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 10),
          Text(
            titulo,
            style: TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
