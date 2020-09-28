class WeatherResponse{

  Coord coord;
  List<Weather> weather;
  String base;
  Main mainwaether;
  int visibility;
  Wind wind;
  Cloud clouds;
  int dt;
  Sys sys;
  int id;
  String name;
  int cod;

  WeatherResponse({
    this.coord,
    this.weather,
    this.base,
    this.mainwaether,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> weatherjson) => WeatherResponse(
    coord: Coord.fromJson(weatherjson["coord"]),
//    weather: Weather.fromJson(weatherjson["weather"]),
    base: weatherjson["base"],
    mainwaether: Main.fromJson(weatherjson["main"]),
    visibility: weatherjson["visibility"],
    wind: Wind.fromJson(weatherjson["wind"]),
    clouds: Cloud.fromJson(weatherjson["clouds"]),
    dt: weatherjson["dt"],
    sys: Sys.fromJson(weatherjson["sys"]),
    id: weatherjson["id"],
    name: weatherjson["name"],
    cod: weatherjson["cod"],
  );

//  Map<String, dynamic> toJson() => {
//    "coord": coord,
//    "weather":weather,
//    "base": base,
//    "main": mainwaether,
//    "visibility": visibility.toJson(),
//    "wind": wind,
//    "clouds": clouds,
//    "dt": dt.toJson(),
//    "sys": sys,
//    "id": id.toJson(),
//    "name": name,
//    "cod": cod,
//
//  };
}

class Coord {

  double lon;
  double lat;

  Coord({this.lon,this.lat});

  factory Coord.fromJson(Map<String,dynamic> coordJson) =>
      Coord(
        lon: coordJson["lon"],
        lat: coordJson["lat"],
      );

  Map<String,dynamic> toJson() =>{
        "lon":lon,
        "lat":lat
  };

}


class Weather {

  int id;
  String main;
  String desc;
  String icon;

  Weather({this.id,this.main,this.desc,this.icon});

  factory Weather.fromJson(Map<String,dynamic> weatherJson) =>
      Weather(
        id: weatherJson["id"],
        main: weatherJson["main"],
        desc: weatherJson["description"],
        icon: weatherJson["icon"],

      );

  Map<String,dynamic> toJson() =>{
    "id":id,
    "main":main,
    "description":desc,
    "icon":icon
  };

}

class Main {

  double temp;
  int pressure;
  int huminity;
  double temp_min;
  double temp_max;


  Main({this.temp,this.pressure,this.huminity,this.temp_min,this.temp_max});

  factory Main.fromJson(Map<String,dynamic> mainJson) =>
      Main(
        temp: mainJson["temp"],
        pressure: mainJson["pressure"],
        huminity: mainJson["huminity"],
        temp_min: mainJson["temp_min"],
        temp_max: mainJson["temp_max"],
      );

  Map<String,dynamic> toJson() =>{
    "temp":temp,
    "pressure":pressure,
    "huminity":huminity,
    "temp_min":temp_min,
    "temp_max":temp_max
  };

}


class Wind{

  double speed;
  int deg;

  Wind({this.speed,this.deg});

  factory Wind.fromJson(Map<String,dynamic> windJson) =>
      Wind(
        speed: windJson["speed"],
        deg: windJson["deg"],
      );

  Map<String,dynamic> toJson() =>{
    "speed":speed,
    "deg":deg
  };

}

class Cloud{
  int all;

  Cloud({this.all});


  factory Cloud.fromJson(Map<String,dynamic> cloudJson) =>
      Cloud(
        all: cloudJson["all"],
      );

  Map<String,dynamic> toJson() =>{
    "all":all
  };

}



class Sys{

  int type;
  int id;
  double message;
  String country;
  int sunrise;
  int sunset;


  Sys({this.type,this.id,this.message,this.country,this.sunrise,this.sunset});

  factory Sys.fromJson(Map<String,dynamic> sysJson) =>
      Sys(
        type: sysJson["type"],
        id: sysJson["id"],
        message: sysJson["message"],
        country: sysJson["country"],
        sunrise: sysJson["sunrise"],
        sunset: sysJson["sunset"],

      );

  Map<String,dynamic> toJson() =>{
    "type":type,
    "id":id,
    "message":message,
    "country":country,
    "sunrise":sunrise,
    "sunset":sunset

  };

}
