import 'package:peliculas/export_route/exports.dart';

class AppRoute {
  static String initialroute = '/';

  static List menuOpcions = [
    MenuOpcion(ruta: '/', pantalla: HomeScreen()),
    MenuOpcion(ruta: '/details', pantalla: DetailsScreen()),
  ];

  static Map<String, WidgetBuilder> getRoute() {
    Map<String, WidgetBuilder> route = {};

    for (final i in menuOpcions) {
      route[i.ruta] = (context) => i.pantalla;
    }
    return route;
  }
}
