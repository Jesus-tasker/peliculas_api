class Peliculas {
  List<Pelicula> items = new List(); //cada item hace referencia a una pelicula

  Peliculas(); //se relacionaran el json de esteos valores

  Peliculas.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  String
      unic_id; //lo usaremos para la tabulacion del swipe a detalles d epeloicula

  int voteCount;
  int id;
  bool video;
  double voteAverage;
  String title;
  double popularity;
  String posterPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String releaseDate;

  Pelicula({
    this.voteCount,
    this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    //especificmos el valores que recibimos del json

    voteCount = json['vote_count'];
    id = json['id'];
    video = json['video'];
    voteAverage =
        json['vote_average'] / 1; //double  /1  es para pasarlo a double
    title = json['title'];
    popularity = json['popularity'] / 1;
    posterPath = json['poster_path'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    genreIds = json['genre_ids'].cast<int>();
    backdropPath = json['backdrop_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
  }

  getposterimage() {
    //aqui haremmos la logica para caargar la imagen

    if (posterPath == null) {
      return 'https://image.freepik.com/free-vector/loading-icon_167801-436.jpg'; //img cargando traida de google

    } else {
      //https://developers.themoviedb.org/3/getting-started/images
      return 'https://image.tmdb.org/t/p/w500/$posterPath'; //cargamos solo el url del poster path //imagen de promcion

    }
  }

  getbackgroundimage() {
    //obtenemos solo la imagen
    //aqui haremmos la logica para caargar la imagen

    if (posterPath == null) {
      return 'https://image.freepik.com/free-vector/loading-icon_167801-436.jpg'; //img cargando traida de google

    } else {
      //backdropPath
      //https://developers.themoviedb.org/3/getting-started/images
      return 'https://image.tmdb.org/t/p/w500/$backdropPath'; //cargamos solo el url del poster path //imagen de promcion

    }
  }
}
