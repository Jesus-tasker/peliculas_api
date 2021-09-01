class Cast {
  List<Actor> actores_list = new List();

  Cast.fromJsonList(List<dynamic> jsonlist) {
    if (jsonlist == null) return;
    jsonlist.forEach((item) {
      final actor = Actor.fromJsonmap(item); //creamos una instancia del actor

      actores_list.add(actor);
    });
  }
}

class Actor {
  //puedes pegar el json  //pegar como json en el view/comant palete y nos genera toda la tabla
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;

  Actor({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
  });

  Actor.fromJsonmap(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    knownForDepartment = json['known_For_Department'];
    name = json['name'];
    originalName = json['original_Name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_Id'];
    order = json['order'];
  }
  getfoto() {
    //aqui haremmos la logica para caargar la imagen

    if (profilePath == null) {
      return 'https://image.freepik.com/free-vector/loading-icon_167801-436.jpg'; //img cargando traida de google

    } else {
      //https://developers.themoviedb.org/3/getting-started/images
      return 'https://image.tmdb.org/t/p/w500/$profilePath'; //cargamos solo el url del poster path //imagen de promcion

    }
  }
}
