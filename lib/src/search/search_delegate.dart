import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/pelicula_model.dart';
import 'package:flutter_application_1/src/providers/peliculas_provider.dart';

//video 121
//https://www.udemy.com/course/flutter-ios-android-fernando-herrera/learn/lecture/14493204#questions/7741832

//LOGICA DE BUSCAdor appbar
class Data_search_buscador extends SearchDelegate {
//acciones //iconos al principio //resultados //suferencias

  String seleccion_string = '';

  final Peliculas_Provider peliculas_provider = new Peliculas_Provider();
  final peliculas = [
    'superman 1',
    'superman 2',
    'superman 3',
    'superman 4',
    'spiderman 1',
    'spiderman 2',
    'spiderman 3',
    'capitanameria ',
    'batman vs superman',
    'aquiaman '
  ];
  final peliculas_recientes = [
    'spiderman',
    'batman',
  ];

  //limpia el buscador
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions //ACciones del appbar //icono cancelar o una X
    // throw UnimplementedError();
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // palablra clave de buscar
        },
      ),
    ];
  }

  //retornar anteroior pagina
  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    //icono a la izquierda del appbar icono buscador por ejemplo----
    //throw UnimplementedError();
    return
        //retornamos la lista de wigets []
        IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        //boton regresar
        //print('leading icon press');
        close(context, null); //regresaera a la pantalla anterior
      },
    );
  }

  //busca los resultados
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //crea los resultados que vamos a msotrar-------
    // throw UnimplementedError();

    return Center(
        child: Container(
      height: 100,
      width: 100,
      //color: Colors.accents,
      child: (Text(seleccion_string)),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //sugerencias cuando la persona escribe----

    //aqui busca las opciones entre la lista
    if (query.isEmpty) {
      return Container();
    }
    return FutureBuilder(
      //recibe una lista cuando hace una peticion https
      // future: Future,
      future: peliculas_provider.buscarPelicula(query),
      //initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData) {
          final peliculas_snap = snapshot.data; //clase -

          return ListView(
              children: peliculas_snap.map((peli) {
            return ListTile(
              leading: FadeInImage(
                  image: NetworkImage(peli.getposterimage()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50,
                  fit: BoxFit.contain),
              title: Text(peli.title),
              subtitle: Text(peli.originalTitle),
              onTap: () {
                close(context, null); //cerrar
                peli.unic_id = ''; //este lo enviamos por requisito
                Navigator.pushNamed(context, 'detalle',
                    arguments: peli); //enviamos el bundle (argument)
              },
            );
          }).toList());
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

/* //original usando la lista sin la api
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    //crea los resultados que vamos a msotrar-------
    // throw UnimplementedError();

    return Center(
        child: Container(
      height: 100,
      width: 100,
      //color: Colors.accents,
      child: (Text(seleccion_string)),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    //sugerencias cuando la persona escribe----
    //throw UnimplementedError();

    //aqui busca las opciones entre la lista
    final listasugerida = (query.isEmpty) //si el listado esta vacio
        ? peliculas_recientes //lista de peliculas recientes
        : peliculas.where(//lista donde busca peliculas
            (p1) => p1.toLowerCase().startsWith(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: listasugerida.length,
      itemBuilder: (contex, i) {
        return ListTile(
          leading: Icon(Icons.movie),
          title: Text(listasugerida[i]),
          onTap: () {
            seleccion_string = listasugerida[i];
            showResults(context);
            //print('pulsado ' + listasugerida[i].toString());
          },
        );
      },
    );
  }
  */
}
