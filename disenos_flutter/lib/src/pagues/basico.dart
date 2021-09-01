import 'package:flutter/material.dart';

class Basico_pague extends StatelessWidget {
  //
  String url_imagen =
      'https://www.duna.cl/media/2020/12/Seg%C3%BAn-Bittax-una-reducci%C3%B3n-en-los-impuestos-de-Bitcoin-no-ayudar%C3%A1-al-crecimiento-de-la-industria.jpg';

  //
  final estilo_titulo = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  final estilo_subtitulo = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //  body: ListView(children: <Widget>[//funciona
        body: SingleChildScrollView(
      //tapa los datos de hora y bateria ene l telefono
      child: Column(children: <Widget>[
        _crearimagen(),
        _contenedor_titulo(),
        _crear_acciones(),
        _creartexto(),
        _creartexto(),
        _creartexto(),
        _creartexto(),
        _creartexto(),
        _creartexto(),
      ]),
    ));
  }

  Widget _crearimagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(url_imagen),
        height: 180,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _contenedor_titulo() {
    return SafeArea(
      //wiget por defecto trae tematicas de ajustar el area
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Row(
          //aqui eta la informacion
          children: <Widget>[
            Expanded(
              child: Column(
                //insertamos la columna en un expanded que por defencto toma ellargo de la pantalla
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment
                    .start, //ordenar os objetoos dentor d ela columna
                children: <Widget>[
                  Text(
                    'titulo: Bitcoin',
                    style: estilo_titulo,
                  ),
                  SizedBox(height: 7),
                  Text(
                    'subtituro: alguna moneda digital',
                    style: estilo_titulo,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }

  Widget _crear_acciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment
          .spaceAround, //modiica de diversas maneras el row al organizar datos
      children: <Widget>[
        _crearAccion(Icons.call, 'Call'),
        _crearAccion(Icons.near_me, 'Rote'),
        _crearAccion(Icons.share, 'shere'),
      ],
    );
  }

  Widget _crearAccion(IconData icon, String texto) {
    //texto e icono nada mas
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 20,
        ),
        SizedBox(
          height: 0.5,
        ),
        Text(
          texto,
          style: TextStyle(fontSize: 16, color: Colors.blue),
        )
      ],
    );
  }

  Widget _creartexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Text(
        'parragfo largiisimo askdjhfkajsdfkajshdfajfhjasdkhfkjsadhfkjasshdfjk ajjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj, asdjfasdj,a skhdfajsk,ajashdkjfhasj,ajahdkjfhmmmakj ',
        textAlign: TextAlign.justify,
      ),
    );
  }
}
