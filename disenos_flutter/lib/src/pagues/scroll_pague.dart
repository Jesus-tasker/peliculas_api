import 'package:flutter/material.dart';

//PAGUE VIEW!!!!
class Scroll_PAgue extends StatelessWidget {
  const Scroll_PAgue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      scrollDirection: Axis.vertical, //animacion de scroll
      //PAGUE VIEW!!!!
      children: <Widget>[_pagina1(), _pagina2()],
    ));
  }

  //los posiciona uno encima de otro lso wigets casi cardview
  //wiget stack
  Widget _pagina1() {
    return Stack(
      children: <Widget>[
        //los primeros son los de al fondo y los ultimos arriba
        _colorfondo(),
        _imagenfondo(),
        _textos(),
      ],
    );
  }

  Widget _colorfondo() {
    return Container(
        width: double.infinity,
        height: double.infinity, //
        //color no entendido del todo fromRGBO
        color: Color.fromRGBO(108, 192, 2018, 1.0));
  }

  Widget _imagenfondo() {
    return Container(
      width: double.infinity, height: double.infinity, //
      child: Image(
        image: AssetImage('assets/scroll.png'),
        fit: BoxFit.cover, //creo qeu es para lso bordes
      ),
    );
  }

  Widget _textos() {
    final stilotexto = TextStyle(color: Colors.white, fontSize: 50.0);

    return SafeArea(
      //es para los nnuevos telefonos y se reajuste al pantalal
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ), //pading
          Text(
            '11°',
            style: stilotexto,
          ),
          Text(
            'Miercoles',
            style: stilotexto,
          ),
          Expanded(
            child: Container(),
          ),
          Icon(Icons.keyboard_arrow_down, size: 70.0),
        ],
      ),
    );
  }

  Widget _pagina2() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Color.fromRGBO(108, 192, 2018, 1.0),
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              height: 100,
            ),
          ),
          Text('PAgina 2'),
          RaisedButton(
            shape: StadiumBorder(),
            color: Colors.white,
            textColor: Colors.red,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 40, vertical: 20), //btn mas gureso
              child: Text(
                'bienvenidos',
                style: TextStyle(fontSize: 20),
              ),
            ),
            onPressed: null,
          ),
          //_colorfondo(),

          //_btn1(),
        ],
      ),
    );
  }
}
