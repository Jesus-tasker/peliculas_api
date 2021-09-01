import 'package:disenos_flutter/src/pagues/Botones_pague.dart';
import 'package:disenos_flutter/src/pagues/scroll_pague.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:disenos_flutter/src/pagues/basico.dart';
import 'package:flutter/services.dart';

//mateapp //creea todo un poryecto vacio
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //cone sta line apodemos cambiar el color de hora y fecha del telefono para que se adecue a lo qeu hacemos
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.black));

    //trasnparente
    // SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
    //statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'diseños',
      initialRoute: 'botones',
      routes: {
        //RUTAS DE NAVEGACION
        'basico': (BuildContext context) => Basico_pague(),
        'scroll': (BuildContext context) => Scroll_PAgue(),
        'botones': (BuildContext context) => BotonesPAgue(),
      },
    );
  }
}
