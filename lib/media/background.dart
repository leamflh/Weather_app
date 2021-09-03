import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/tools/WeatherModel.dart';

class BackgroundType{

 static WeatherType backgroundweather(Map<String,dynamic> parsedJson){

           var data=WeatherModel.formJson(parsedJson);
           var sunrise=data.sunrise;
           var sunset=data.sunset;
           var recentTime=data.nowDate;
           DateTime sunriseTime=DateFormat("hh:mm").parse(sunrise);
           DateTime sunsetTime=DateFormat("hh:mm").parse(sunset);
            int id=parsedJson['list'][0]['weather'][0]['id'];

        if(id>199 && id<=232)
          return WeatherType.thunder;
        if(id>=300 && id<=321)
          return WeatherType.lightRainy;
        if(id>=500 && id<=531)
          return WeatherType.heavyRainy;
        if(id>=600 && id<=622)
          return WeatherType.heavySnow;
        if(id>=701 && id<=781)
          return WeatherType.dusty;
        if(id>=801 && id<=804){
          if(recentTime.hour>sunriseTime.hour && recentTime.hour<sunsetTime.hour){
            return WeatherType.cloudy;
          }
           else return WeatherType.cloudyNight;
          }
        if(id==800){
          if(recentTime.hour>sunriseTime.hour && recentTime.hour<sunsetTime.hour){
            return WeatherType.sunny;
          }
          else return WeatherType.sunnyNight;
        }


        return WeatherType.foggy; // fi hal ma akhad wala shi
        }


  }


