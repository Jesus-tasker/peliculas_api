import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pagues/home_pague1.dart';
import 'package:flutter_application_1/src/pagues/peliculas_detalle_pague.dart';

//escribe Mateapp y me aparece todo ya creado para correr una app

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //cone sto quitamos el logo de baner arriba
      title: 'Peliculas ',
      initialRoute: '/',
      routes: {
        '/': (BuildContext contex) => Home_pague1(),
        'detalle': (BuildContext contex) => Pelicula_Detalle_pg(),
      },
    );
  }
}
