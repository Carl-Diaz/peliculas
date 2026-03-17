import 'package:flutter/material.dart';

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
          SliverList(delegate: SliverChildListDelegate([_PosterMovie()])),
        ],
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
              Text('Original Title',overflow: TextOverflow.ellipsis,),
              Row(
                spacing: 5,
                children: [
                  Icon(Icons.star, color: Colors.amber,),
                  Text("8.3"), 
                  Text('Average')]),
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
