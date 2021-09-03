
import 'package:intl/intl.dart';
import 'package:weather_app/tools/UnixToDate.dart';
class WeatherModel{
  String country;
  String condition;

  int temperature;
  int maxTemperature;
  int minTemperature;

  int id;
  int pressure;

  var sunrise;
  var sunset;
  String descriptionWeather;
  var chanceOfRain;
  int humidity;
  var wind;
  var feelsLike;
  int precipitation;
  var visibility;
  var seaLevel;
  var nowDate;



  WeatherModel.formJson(Map<String,dynamic> parsedJson){
    var _sunriseUnix;
    var _sunsetUnix;

    country=parsedJson['city']['name'];
    condition=parsedJson['list'][0]['weather'][0]['description'];

    var _doubleTemperature=parsedJson['list'][0]['main']['temp'];
     try{
       temperature=_doubleTemperature.round();
     }catch(e1){
       temperature=_doubleTemperature;
     }


    var _min=parsedJson['list'][1]['main']['temp_min'];
    try{
      minTemperature=_min.round();
    }catch(e2){
      minTemperature=_min;
    }


    var _max=parsedJson['list'][1]['main']['temp_max'];
    try{
      maxTemperature=_max.round();
    }catch(e3){
      maxTemperature=_max;
      print(e3);
    }


    id = parsedJson['list'][0]['weather'][0]['id'];
    descriptionWeather=parsedJson['list'][0]['weather'][0]['description'];


    _sunriseUnix=parsedJson['city']['sunrise'];
    _sunsetUnix=parsedJson['city']['sunset'];
    sunrise=readTimestamp(_sunriseUnix);
    sunset=readTimestamp(_sunsetUnix);


    try{
      chanceOfRain=(parsedJson['list'][0]['pop']*100).round();
    }catch(e){
      chanceOfRain=parsedJson['list'][0]['pop']*100;
      print(e);
    }
    try{
      precipitation=(parsedJson['list'][0]['rain']['3h']).round();
    }catch(e0){
      precipitation=0;
      print(e0);
    }
    try{
      feelsLike=(parsedJson['list'][0]['main']['feels_like']).round();
    }catch(e1){
      feelsLike=parsedJson['list'][0]['main']['feels_like'];
      print(e1);
    }
    try{
      wind=(parsedJson['list'][0]['wind']['speed']*3.6).round();
    }catch(e2){
      wind=parsedJson['list'][0]['wind']['speed']*3.6;
      print(e2);
    }

    wind=(parsedJson['list'][0]['wind']['speed']*3.6).round();

    visibility=(parsedJson['list'][0]['visibility'])/1000;
    pressure=parsedJson['list'][0]['main']['pressure'];
    seaLevel=parsedJson['list'][0]['main']['sea_level'];
    humidity=parsedJson['list'][0]['main']['humidity'];

    var date = parsedJson['list'][0]['dt_txt'];
     nowDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);






  }


}