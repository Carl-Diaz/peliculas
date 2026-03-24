import 'package:flutter/material.dart';
import 'package:peliculas/export_route/exports.dart';
import 'package:peliculas/widgets/info_movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> movie =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(
            movieTitle: movie["movie_title"],
            portada: movie["portada"],
          ),
          //Text('second child', style: TextStyle(color: Colors.black),)
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterMovie(
                miniPortada: movie["portada"],
                tituloOriginal: movie["original_title"],
                subtitulo: movie["movie_title"],
                puntuacion: movie["vote_average"],
              ),
              _InfoMovie(sinopsis: movie["sinopsis"],),
              MovieSlider(dataMovie: movie["results"]),
            ]),
          ),
        ],
      ),
    );
  }
}

class _InfoMovie extends StatelessWidget {
  String sinopsis;
  _InfoMovie({required this.sinopsis});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              SizedBox(height: 10),
              Text(
                'Sinopsis',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                sinopsis,
                textAlign: TextAlign.justify,
              ),

              //InfoMovie()
            ],
          ),
        ),
      ),
    );
  }
}

class _PosterMovie extends StatelessWidget {
  String miniPortada;
  String subtitulo;
  String tituloOriginal;
  double puntuacion;

  _PosterMovie({
    required this.miniPortada,
    required this.subtitulo,
    required this.tituloOriginal,
    required this.puntuacion,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/valverde.jpg'),
            image: NetworkImage(
              "https://image.tmdb.org/t/p/w600_and_h900_face" + miniPortada,
            ),
            height: 150,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subtitulo,
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              Text(tituloOriginal, overflow: TextOverflow.ellipsis),
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text("${puntuacion}"),
                  Text('Average'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  String portada;
  String movieTitle;
  _CustomAppBar({required this.portada, required this.movieTitle});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black26,
          child: Text(
            movieTitle,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/valverde.jpg'),
          image: NetworkImage(
            "https://image.tmdb.org/t/p/w600_and_h900_face" + portada,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
