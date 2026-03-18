import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class InfoMovie extends StatelessWidget {
  const InfoMovie({super.key});

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
          Text('Actores - reparto', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black, ),
          ),
          SizedBox(height: 0,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (_,index)=>_Info()
              ))
        ],
      ),
      );
  }
}

class _Info extends StatelessWidget {
  const _Info({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      //color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
        children: [
          
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/valverde.jpg'), 
                image: NetworkImage('https://picsum.photos/300/400'),
                fit: BoxFit.cover,),
            ),
          
          SizedBox(height: 10,),
          Text('Actor', style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
          softWrap: true,)
        ],
      ),
    );
  }
}
