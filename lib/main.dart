import 'package:flutter/material.dart';
import 'package:peliculas/routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.initialroute,
      routes: AppRoute.getRoute(),
      theme: ThemeData.dark()
      
    );
  }
}
