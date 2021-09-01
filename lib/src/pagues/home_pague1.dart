import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/providers/peliculas_provider.dart';
import 'package:flutter_application_1/src/search/search_delegate.dart';
//import 'package:flutter_application_1/src/models/pelicula_model.dart';
import 'package:flutter_application_1/src/wigetts/card_swiper_.dart';
import 'package:flutter_application_1/src/wigetts/movies_horizontal.dart';

///import 'package:flutter_swiper/flutter_swiper.dart';

//PAginas importantes para realizar esto
//swipe_to: ^0.0.1+8
//https://pub.dev/packages/flutter_swiper/versions/1.1.6

// ignore: camel_case_types
class Home_pague1 extends StatelessWidget {
  final peliculas_P_instance = new Peliculas_Provider();

  @override
  Widget build(BuildContext context) {
    peliculas_P_instance
        .getPopulares(); //trae l a lista d epeliculas popuares desde el inciio de cargar la apgina

    return Scaffold(
        appBar: AppBar(
          //SEARCH
          centerTitle: false, //asi el titulo inicia al inicio no al centro
          title: Text('peliculas en cines '),
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              //buscador
              icon: Icon(Icons.search),
              onPressed: () {
                //methodo de slutter
                showSearch(
                  context: context,
                  delegate: Data_search_buscador(), //importamos el buscador
                  //query: 'hola ' //no es necesario pero podemos mandar el query desde l inicio
                );
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment
                .spaceAround, //psrar espacios de todos lods objetos dibujados
            children: <Widget>[
              _swipe_tarjetas(), //pelicualas cartelera []
              _footer_tarjetas2(context) //peliculas popuares
            ],
          ),
        ));
  }

  Widget _swipe_tarjetas() {
    return FutureBuilder(
      future: Peliculas_Provider()
          .getEncines(), //llamada http y pbtiene la lista de peliculas
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        //pasa el esnap chop a una lsita
        //vamos a enviar la data del snapshop
        if (snapshot != null) {
          return Card_swipeer(peliculas_list: snapshot.data); //clase
        } else {
          return Container(
              height: 400, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
    /* ///llamamos a la api de peliculas video 100
    //importar esto
    peliculasprovider.getEncines();

    //retornamos el swiped creado en el methodo cardswiped
    return Card_swipeer(peliculas_list: [1, 2, 3, 4, 5]);
    */
    ///////////motrar wiget basico
    /*return Container(
      padding: EdgeInsets.only(top: 20), //pading superos
      //le decimos el tamaño que debe tener y donde sacar las imagens
      width: double.infinity, //usar tood el ancho
      height: 300,
      child: Swiper(
        //tabulador paginador mejor que appaer adapter

        layout:
            SwiperLayout.STACK, //aqui pasamos el tipo de paginacion super util!
        itemWidth: 200.0, //tamaño de como se ve el componente siper
        itemBuilder: (BuildContext context, int index) {
          return new Image.network(
            "http://via.placeholder.com/350x150",
            fit: BoxFit.fill,
          ); //fit se adapta a las dimensiones que tiene
        },
        itemCount: 3,
        pagination:
            new SwiperPagination(), //viene por defecto es para mostrar los puntitos de abajo para paginar
        control:
            new SwiperControl(), //viene por defecto para mover hacia los ladors
      ),
    );*/
  }

  Widget _footer_tarjetas2(BuildContext context) {
    ////https://developers.themoviedb.org/3/movies/get-popular-movies

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, //todo a la izquierda , es columna
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'populares',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ), //stylo por defecto
          SizedBox(height: 5.0),
          //StreamBuilder(
          //no quiere
          FutureBuilder(
            // stream: Peliculas_Provider() .popularsStream, //llamada http y pbtiene la lista de peliculas
            future: Peliculas_Provider()
                .getPopulares(), //llamada http y pbtiene la lista de peliculas
            // initialData: InitialData,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              print(snapshot.data);
              // snapshot.data?= hacer el metodo si existe o si es !=null
              //snapshot.data?.forEach((p) => print(p.tittle)); //preginta si existe el objeto y lo imprime

              if (snapshot.hasData) {
                return Movie_horizontal(
                  //carga lista
                  peliculas_list: snapshot.data,
                  siguiente_pagina: peliculas_P_instance.getPopulares,
                ); //clase
              } else {
                return CircularProgressIndicator();
                //print('Homep: ' + snapshot.data.toString());
              }

              //return Container();
            },
          )
        ],
      ),
    );
  }
}
