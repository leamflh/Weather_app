import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/weather_app/lib/media/background.dart';
import 'package:weather_app/tools/WeatherModel.dart';
import 'package:weather_app/Screens/Welcome_Screen.dart';


class IdentityCard extends StatelessWidget {
  final  decodedData;
  IdentityCard(this.decodedData);

  @override
  Widget build(BuildContext context) {
    var weatherInfo=WeatherModel.formJson(decodedData);
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen(decodedData)));
      },
      child: Stack(

        children: [
          WeatherBg(
            width: MediaQuery.of(context).size.width,
            height: 111.0,
            weatherType: BackgroundType.backgroundweather(decodedData),
          ),
          Padding(
            padding: const EdgeInsets.only(top:20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:40.0,left: 20.0),
                  child: Text(weatherInfo.country,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text('${weatherInfo.temperature}°',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                    ),),
                ),
              ],


            ),
          ),
        ],
      ),
    );
  }
}
