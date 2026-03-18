import 'package:flutter/material.dart';
import 'package:peliculas/widgets/info_movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          //Text('second child', style: TextStyle(color: Colors.black),)
          SliverList(
            delegate: SliverChildListDelegate([_PosterMovie(), _InfoMovie(), InfoMovie()]),
          ),
        ],
      ),
    );
  }
}

class _InfoMovie extends StatelessWidget {
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
              SizedBox(height: 10,),
              Text('Sinopsis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20), ),
              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', textAlign: TextAlign.justify, ),
              //InfoMovie()
      
            ],
          ),
        ),
      ),
    );
  }
}

class _PosterMovie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/valverde.jpg'),
            image: NetworkImage('https://picsum.photos/300/500'),
            height: 150,
          ),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Movie Title',
                style: Theme.of(context).textTheme.titleLarge,
                overflow: TextOverflow.ellipsis,
              ),
              Text('Original Title', overflow: TextOverflow.ellipsis),
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text("8.3"),
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
            'Movie-title',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/valverde.jpg'),
          image: NetworkImage('https://picsum.photos/500/300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
