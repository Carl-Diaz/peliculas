
import 'package:peliculas/barril/barril.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Peliculas en carteleras', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.search), color: Colors.white,)
        ],
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          CardSwiper(),
          MovieSlider()

        ],
      ),
    );
  }
}
