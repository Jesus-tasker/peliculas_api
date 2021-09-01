import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/actores_model.dart';
import 'package:flutter_application_1/src/models/pelicula_model.dart';
import 'package:flutter_application_1/src/providers/peliculas_provider.dart';

class Pelicula_Detalle_pg extends StatelessWidget {
  //recibe informacion de movies horizontal para obtener la inforamcion de la pelicula
  @override
  Widget build(BuildContext context) {
    //es como se recibiria un bundle
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        body: CustomScrollView(
      //SCROLL VIEW
      slivers: <Widget>[
        //SLIVERS ES CASI LO MISMO QUE DECIR  CHILDS: ...
        _crearappbar(pelicula), //APPBAR
        SliverList(
          //es como un list view
          delegate: SliverChildListDelegate(// LISTA DE WIGETS
              [
            SizedBox(
              height: 10,
            ),
            _postertitulo(context, pelicula),
            _descripcion(context, pelicula),
            _descripcion(context, pelicula),
            _descripcion(context, pelicula),
            _crearcastingactores(pelicula)
          ]),
        ),
      ],
    ));
  }

  Widget _crearappbar(Pelicula pelicula) {
    //app bar que se empuja hacia a rriba
    //appa bar que al deslizarce hacia abajo muestra la pelicula
    return SliverAppBar(
        elevation: 2.0,
        backgroundColor: Colors.indigoAccent,
        expandedHeight: 200,
        floating: false, //false
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            pelicula.title,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          background: FadeInImage(
            image: NetworkImage(pelicula
                .getbackgroundimage()), //trae  el emthodo que lee el background del poster
            placeholder: AssetImage('assets/img/loading.gif'),
            fadeInDuration: Duration(microseconds: 150),
            fit: BoxFit.cover,
          ),
        ) //null,//aqui recibe un wiget que se adapte al appbar
        );
  }

  Widget _postertitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        children: <Widget>[
          Hero(
            tag: pelicula
                .unic_id, //tag igual para hacer la animacion /movie horizontal()
            child: ClipRRect(
              //este recibe el mismo id de pelicula para hacer animacion HERO :D
              //imagen
              //tipo de wiget
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(pelicula.getposterimage()),
                height: 170,
              ),
            ),
          ),
          Flexible(
            //titrulo y subtitulo
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  pelicula.title,
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  pelicula.originalTitle,
                  style: Theme.of(context).textTheme.subtitle2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(pelicula.voteAverage.toString(),
                        style: Theme.of(context).textTheme.subtitle2)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion(BuildContext context, Pelicula pelicula) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Text(pelicula.overview,
            style: Theme.of(context).textTheme.subtitle2));
  }

  Widget _crearcastingactores(Pelicula pelicula) {
    final peliprovider = new Peliculas_Provider();
    return FutureBuilder(
      //future: Future,
      future: peliprovider.getclass(pelicula.id.toString()),

      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _crearactorespagueview(snapshot.data); //methodo
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _crearactorespagueview(List<Actor> actores_data) {
    return SizedBox(
      height: 200,
      child: PageView.builder(
          controller: PageController(viewportFraction: 0.3, initialPage: 1),
          itemCount: actores_data.length,
          itemBuilder: (context, i) => _actortarjeta(actores_data[i])
          //{return Text(actores_data[i].name); //pasamos el objeto nombre el actor
          //},
          ),
    );
  }

  Widget _actortarjeta(Actor actor) {
    return Container(
        child: Column(children: <Widget>[
      ClipRRect(
        //borde redondo
        borderRadius: BorderRadius.circular(20),
        child: (FadeInImage(
          image: NetworkImage(actor.getfoto()),
          placeholder: AssetImage('assets/img/no-image.jpg'),
          fit: BoxFit.cover,
        )),
      ),
      Text(
        //nombre del actor con texto ajustable
        actor.name,
        overflow: TextOverflow.ellipsis,
      )
    ]));
  }
}
