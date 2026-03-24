import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AppProvider {
  static Future<Map<String, dynamic>> getApi() async {
    final url = Uri.parse(
      "https://api.themoviedb.org/3/movie/now_playing?api_key=9f1748708b19596cd26d2dcbdde0382e&language=es-MX&page=1",
    );
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      } else {
        print("No hay cuerpo de la peticion");
        return {"mensaje": "error al conectar la api"};
      }
    } catch (e) {
      return {"mensaje": "error al conectar la api"};
    }
  }
}
