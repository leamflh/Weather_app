import 'package:flutter/material.dart';
import 'package:weather_app/tools/From24hTo12h.dart';


class WeatherCardHorizontal extends StatelessWidget {
  final  date;
  final  id;
  final temperature;
  final icon;
  WeatherCardHorizontal(this.date,this.id,this.temperature,this.icon);




  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0,left: 23.0),
          child: Text(getDate(date),
              style: TextStyle(
                  fontSize: 12.0,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              )),
        ),
        Padding(
          padding:EdgeInsets.only(left: 20.0),
          child: Image.network('http://openweathermap.org/img/wn/$icon@2x.png',
            width: 65.0,

    ),
    /*Icon(
            WeatherIcon.getIcon(IconWeather.iconWeather(id, date)),*/

          ),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text('$temperature °',
    style: TextStyle(
    fontSize: 14.0,
    color: Colors.white,),),
        ),


      ],
    );
  }
}
