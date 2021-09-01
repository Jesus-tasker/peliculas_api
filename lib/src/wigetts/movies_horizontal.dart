import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/pelicula_model.dart';

// ignore: camel_case_types
class Movie_horizontal extends StatelessWidget {
  //const Movie_horizontal({Key key}) : super(key: key);
  final List<Pelicula> peliculas_list;

  final Function siguiente_pagina;

  final _pagueController = new PageController(
    //saber cuando el usuario esta enultima posisicon
    initialPage: 1, //pagina de inicio
    viewportFraction: 0.3, //cantidad de imagenes a mostrar en la pantalla);
  );

  Movie_horizontal(
      {
      // ignore: non_constant_identifier_names
      @required this.peliculas_list,
      // ignore: non_constant_identifier_names
      @required this.siguiente_pagina});

  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;

    _pagueController.addListener(() {
      //si lelga al final del scroll cargar pelicuals
      if (_pagueController.position.pixels >=
          _pagueController.position.maxScrollExtent - 200) {
        //print('cargar siguiente pagina ');
        siguiente_pagina();
      }
    });

    return Container(
        //usar 20 % de pantalla
        height: _screensize.height * 0.3,
        child: PageView.builder(
          pageSnapping: false, //no entendi bien esta funcion
          //similar a l swiper
          controller: _pagueController,
          itemCount: peliculas_list.length,
          itemBuilder: (contex, i) {
            return _tarjeta_buuilder(contex, peliculas_list[i]);
          },
          //children: _tarjetas(context), //PageView.builder
        ));
  }

  //Esta es la que usammos actualmente hy dunciona
  Widget _tarjeta_buuilder(BuildContext context, Pelicula pelicula_instancia) {
    pelicula_instancia.unic_id = '${pelicula_instancia.id}-poster'; //video 119

    final tarjeta = Container(
      margin: EdgeInsets.only(right: 15.0),
      child: Column(
        children: <Widget>[
          Hero(
            tag: pelicula_instancia
                .unic_id, //cambiamos el id unico para que reciba datos
            child: ClipRRect(
              //wiget circular
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                  //IMAGEN
                  image: NetworkImage(pelicula_instancia
                      .getposterimage()), //cargar imgane existente
                  placeholder: AssetImage(
                      'assets/img/no-image.jpg'), //img mientras carga
                  fit: BoxFit.cover,
                  height: 160 //ancho posiible
                  ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            pelicula_instancia.title,
            overflow:
                TextOverflow.ellipsis, //cuando el texto no cabe pone puntitos
            style: Theme.of(context).textTheme.caption,
          )
        ],
      ),
    );

    //retornaremos la targeta con un gestor para agregar tabulacions  coo presion sobre la tarjeta
    return GestureDetector(
      child: tarjeta,
      onTap: () {
        // print('id de la pelicula ${pelicula_instancia.title}'); //
        // pasamos a la siguiente pantallla, //arguments es como el bundle
        Navigator.pushNamed(context, 'detalle', arguments: pelicula_instancia);
      },
    );
  }

  //cramos el item view  y la forma de ver las imageens cuando recibe la lista
  List<Widget> _tarjetas(BuildContext context) {
    //otra forma de crear la muestra de las tarjetas pasando la lista peliculas a un map

    return peliculas_list.map((pelicula_instancia) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              //wiget especial para hacer animaciones cuando tiene imagenes relacionadas entre actividades
              tag: pelicula_instancia
                  .id, //id unico para la animacion con la otra tarjeta
              //ese id solo debe ser igual en ambos
              child: ClipRRect(
                //lo envolvemos en un wiget para pasarlo con una animacion de una actividad a otra
                //wiget circular
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    //IMAGEN
                    image: NetworkImage(pelicula_instancia
                        .getposterimage()), //cargar imgane existente
                    placeholder: AssetImage(
                        'assets/img/no-image.jpg'), //img mientras carga
                    fit: BoxFit.cover,
                    height: 160 //ancho posiible
                    ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              pelicula_instancia.title,
              overflow:
                  TextOverflow.ellipsis, //cuando el texto no cabe pone puntitos
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}
