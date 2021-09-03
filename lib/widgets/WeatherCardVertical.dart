import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/weather_app/lib/media/iconWeatherForColumn.dart';
import 'package:intl/intl.dart';

class WeatherCardVertical extends StatelessWidget {
  final  date;
  final  id;
  final minTemperature;
  final maxTemperature;
  WeatherCardVertical(this.date,this.id,this.minTemperature,this.maxTemperature);

  @override
  Widget build(BuildContext context) {

    String day=DateFormat('EEEE').format(date); //convert DateTime to string
    String icon=IconWeather.iconWeatherVertical(id); // getting the right icon name based on the id

    return Padding(
      padding: const EdgeInsets.only(right:5.0,top:8.0),
      child:Column(
       
        children: [
          Row(

            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding:EdgeInsets.only(left: 20.0),
                  child: Text(day,
                      style: TextStyle(
                        fontSize: 13.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )),
                ),
              ),

              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child:Image.network('http://openweathermap.org/img/wn/$icon@2x.png',
                    width: 50.0,

                  ),
                ), 
              ),
              SizedBox(
                width:30.0,
              ),
              Expanded(
                flex:2,
                child: Padding(
                  padding: const EdgeInsets.only(left:17.0,right:15.0),
                  child: Text('$maxTemperature ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,),),
                ),
              ),
              Expanded(
                flex:2,
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text('$minTemperature ',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,),),
                ),
              ),

            ],
          ),

        ],
      ),

    );
  }
}
