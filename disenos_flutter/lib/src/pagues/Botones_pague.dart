import 'dart:ui';

import 'package:flutter/material.dart';

import 'dart:math';

import 'package:flutter/rendering.dart';

class BotonesPAgue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            _fondoapp(), //FONDOS
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _titulos(),
                  _botonesredondeados(),
                ],
              ),
            )
          ],
        ),
        bottomNavigationBar: _bottom_navidation_bar(context));
  }

  //1
  Widget _fondoapp() {
    //condo con un stack para hacer shapes y formas con los colores
    //fondo morado con shape
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        //crea un barrido
        gradient: LinearGradient(
            begin: FractionalOffset(
                //barrido de color shape
                0.0,
                0.6), //posicion x(0.0) arriba a la izquierda d ela apntalla
            end: FractionalOffset(0.0, 1.0),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              //Colors.blue
              Color.fromRGBO(35, 37, 57, 1.0)
            ]),
      ),
    );

    //transform es un wiget que gira para dar una apariencia mas dinamica
    final cajarosada = Transform.rotate(
      angle: -pi / 7.0,
      child: Container(
        height: 330,
        width: 330,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80),
            //color: Colors.pink
            gradient: (LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 177, 1.0)
            ]))),
      ),
    );

    //retornamos los wigets utilizados sins salir del methodo
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          //permite mover la posicion del wiget interno
          top: -100,
          right: 50,
          child: cajarosada,
        ),
      ],
    );
  }

//2
  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, //alineacion colum
          children: <Widget>[
            Text(
              'clasyfy trnasaccion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold, //negrilla
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'this is a transaccion for the next cathegoryes',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

//3
  //creamos un tema para cambiar los colores del navegationbotton
  Widget _bottom_navidation_bar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          canvasColor:
              Color.fromRGBO(55, 57, 84, 1.0), //background del navigator
          primaryColor: Colors.pink,
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: BottomNavigationBar(
        fixedColor: Colors.blue,
        //NAvigatorbottom
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30,
            ),
            title: Container(), //sin texto
            //title: Text('pague1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart_outlined),
            title: Container(), //sin texto
            //title: Text('pague2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            title: Container(), //sin texto
            //title: Text('pague2'),
          ),
        ],
      ),
    );
  }

  Widget _botonesredondeados() {
    return Table(
      //para que funcione los tablerows deben tener la misma cantidad de elementos internos , similar al recicler
      children: [
        TableRow(children: [
          _crearbotonredondo(Colors.blue, Icons.ac_unit, " cont1"),
          _crearbotonredondo(Colors.purple, Icons.accessibility_new, " cont2"),
        ])
      ],
    );
  }

  Widget _crearbotonredondo(
      Color color_selec, IconData icon_selec, String texto_selec) {
    return BackdropFilter(
      //borroso todo el fondo
      filter: ImageFilter.blur(sigmaX: 0.5, sigmaY: 0.5), //filter
      child: Container(
        height: 180,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 66, 107, 0.70),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              //Circle avatar
              backgroundColor: color_selec,
              radius: 35,
              child: Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
            ),
            Text(
              '$texto_selec',
              style: TextStyle(color: color_selec, fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
