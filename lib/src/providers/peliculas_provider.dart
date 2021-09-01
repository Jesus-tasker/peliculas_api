import 'dart:async';

import 'package:flutter_application_1/src/models/actores_model.dart';
import 'package:flutter_application_1/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http; //version 12 para que funcione
import 'dart:convert';

//http: ^0.13.1
//https
//llamamos en homepague este methodo
//https://www.themoviedb.org/settings/api
//jesus-montoya // 94012001880 //clave y contraseña

class Peliculas_Provider {
  // peticiones https api
  String _apikey =
      '9f4a08edf180bb622e7f5ae5edcffa4d'; //api key real  //fh //'1865f43A0549ca50d341dd9ab8b29f49';
  String _urlhttps = 'api.themoviedb.org'; //api.themoviedb.org
  String _lenguaje = 'es-ES';
  int _popularpage = 0; //

  bool _cargandoimgenes = false;

//////////STREAM//////////
  List<Pelicula> _populares = new List(); //contenerdor de peliculas
  //broadast es para especificar que se lllamara de varios lugares
  final _popuulares_StreamControler = StreamController<
      List<
          Pelicula>>.broadcast(); //recibe la lista del objeto(pelicula) que desea actualizar

  //regla de lo que recibe  //y envia esos datos ene ste caso el tipo pelicual
  Function(List<Pelicula>) get popularesSink =>
      _popuulares_StreamControler.sink.add; //ADD

  Stream<List<Pelicula>> get popularsStream =>
      _popuulares_StreamControler.stream;

  void disposeStreams() {
    _popuulares_StreamControler
        ?.close(); // ?=si tiene informacion llamalo si no sno
  }

  /////procesar
  Future<List<Pelicula>> _procesarrespuesta_https(Uri url) async {
    //forma simple de hacer la llamada
    //forma simple de llamar

    final resp = await http.get(url);
    final decode_data = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decode_data['results']);

    print(peliculas.items[0].title + ': pelis provider');
    return peliculas.items;
  }

////////////////////////
//https://developers.themoviedb.org/3/movies/get-movie-lists
  Future<List<Pelicula>> getEncines() async {
    //https://api.themoviedb.org/3/movie/550?api_key=9f4a08edf180bb622e7f5ae5edcffa4d //ejemplo
    final url = Uri.https(_urlhttps, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _lenguaje,
    });

    return await _procesarrespuesta_https(url);
  }

  //https://api.themoviedb.org/3/movie/550?api_key=9f4a08edf180bb622e7f5ae5edcffa4d //ejemplo
  Future<List<Pelicula>> getPopulares() async {
    _popularpage++; //pagina de snapshops que recibe la llamada https (109)
    if (_cargandoimgenes) return [];
    _cargandoimgenes = true;
    print('cargando sigueintes');
    final url = Uri.https(_urlhttps, '3/movie/popular', {
      'api_key': _apikey,
      'language': _lenguaje,
      'page': _popularpage.toString(),
    });

    final resp =
        await _procesarrespuesta_https(url); //respuesta completa del json

    _populares.addAll(resp); //lista de peliculas
    popularesSink(_populares);
    _cargandoimgenes = false;

    return resp;
  }

//actores
  Future<List<Actor>> getclass(String peli_id) async {
    final url = Uri.https(_urlhttps, '3/movie/$peli_id/credits', {
      'api_key': _apikey,
      'language': _lenguaje,
      //  'movie_id': peli_id,
    });

    final resp = await http.get(
        url); // _procesarrespuesta_https(url); //respuesta completa del json

    final deocodedata = json.decode(resp.body); //decodigficamos a json
    /// final peliculas = new Peliculas.fromJsonList(decode_data['results']);

    final cast = Cast.fromJsonList(
        deocodedata['cast']); //Cast.fromJsonList(deocodedata);
    return cast.actores_list;
  }

  //buscar peliculas usando el api por nombre en especial con el Search
  Future<List<Pelicula>> buscarPelicula(String query_str) async {
    //https://api.themoviedb.org/3/movie/550?api_key=9f4a08edf180bb622e7f5ae5edcffa4d //ejemplo
    final url = Uri.https(_urlhttps, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _lenguaje,
      'query': query_str,
    });

    return await _procesarrespuesta_https(url);
  }
}
