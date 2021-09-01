import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/models/pelicula_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Card_swipeer extends StatelessWidget {
  //pasamos la lista del objteo como si fuera el adapter para mostrarlo
  // const Card_swipeer({Key key}) : super(key: key);

  final List<Pelicula> peliculas_list;

  Card_swipeer(
      {@required
          this.peliculas_list}); //esto obliga a que debe tenerel requisito d ela lista para funcionar

  @override
  Widget build(BuildContext context) {
    //para vambiar el tamaño de las tarjetas usamos el tamaño del sispitivo
    final _screensize =
        MediaQuery.of(context).size; //obtenemos tamaño d ela pantalla

    return Container(
      //CONTENEDOR CON EL SWIPE <..> PARA MOVERSE
      //le decimos el tamaño que debe tener y donde sacar las imagens
      width: double.infinity, //usar tood el ancho
      padding: EdgeInsets.only(top: 10), //pading superos
      //width: _screensize.width * 0.7 , //que el tamaño sea el 70% de ancho en la pantalla
      height: _screensize.height * 0.4, //la mitad del dispitivo

      child: Swiper(
        //tabulador paginador mejor que paper adapter
        layout:
            SwiperLayout.STACK, //aqui pasamos el tipo de paginacion el efecto
        itemHeight: _screensize.width * 0.8,
        itemWidth: _screensize.height * 0.3,
        itemBuilder: (BuildContext context, int index) {
          //hace el ciclo de los elementos como peliuclas el ciclo for
          peliculas_list[index].unic_id =
              '${peliculas_list[index].unic_id}_tarjeta'; //video 119
          //arriba creamos el id unico para que no se repita cuando pasamos parametros entre actividades
          return Hero(
            tag: peliculas_list[index].id,
            child: ClipRRect(
                //clip reect para poner el border y dento ponemos la imagen
                borderRadius: BorderRadius.circular(20),
                child:
                    //new Image.network("http://via.placeholder.com/350x150", fit: BoxFit.cover,
                    //fit se adapta a las dimensiones que tiene,
                    GestureDetector(
                  //wiget para pasar entre activityes
                  onTap: () {
                    print('tappp');
                    Navigator.pushNamed(context, "detalle",
                        arguments: peliculas_list[index]);
                  },
                  child: FadeInImage(
                    image: NetworkImage(peliculas_list[index]
                        .getposterimage()), // peliculas_list[index].getposterimage()
                    placeholder: AssetImage('assets/img/no-image.jpg'),
                    fit: BoxFit
                        .cover, //reparo el error del controno medio ciruclar
                  ),
                )),
          );
        },
        itemCount: peliculas_list.length, //3,
        //pagination:    new SwiperPagination(), //viene por defecto es para mostrar los puntitos de abajo para paginar
        control:
            new SwiperControl(), //viene por defecto para mover hacia los ladors
      ),
    );
  }
}
