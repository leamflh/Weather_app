import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/weather_app/lib/tools/List_Of_IdentityCard.dart';
import 'package:weather_app/tools/WeatherModel.dart';
import 'package:weather_app/tools/UpperCase.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/weather_app/lib/media/background.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/WeatherCardHorizontal.dart';
import 'package:weather_app/widgets/WeatherCardVertical.dart';
import 'package:weather_app/widgets/InfoCard_WelcomeScreen.dart';
import 'package:weather_app/Screens/ListScreen.dart';
import 'package:weather_app/widgets/IdentidyCard_SearchScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_app/Methods/WelcomeScreenMethods.dart';
import 'package:weather_app/tools/constant.dart';


class WelcomeScreen extends StatefulWidget {

  final decodedData;
  WelcomeScreen([this.decodedData]);


  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
   List<WeatherCardHorizontal> listInRow=[];
   List<WeatherCardVertical> listInColumn=[];




  @override
  void initState() {
    super.initState();

    var data=WeatherModel.formJson(widget.decodedData).country; //This will give us the country fetched
    // to check if it's a new one , to prevent duplicated countries in the Search screen.
    print('hey');
    listInRow=Method.horizontalSlideList(widget.decodedData); // Filling the list
    listInColumn=Method.verticalSlideList(widget.decodedData); // Filling the list

    if(!ListOfIdentityCard.listOfCountriesAdded.contains(data)){
      ListOfIdentityCard.listOfCard.insert(ListOfIdentityCard.listOfCard.length-1,IdentityCard(widget.decodedData));
      ListOfIdentityCard.listOfCountriesAdded.add(data);

    }





  }

  @override
  Widget build(BuildContext context) {

    var weatherInfo=WeatherModel.formJson(widget.decodedData);

    return Stack(
      children: [
        WeatherBg(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            weatherType: BackgroundType.backgroundweather(widget.decodedData) ),
        SafeArea(
          child: Scaffold(
            bottomNavigationBar:Container(
              height: 50.0,
              decoration: BoxDecoration(
                border: Border(
                  top:BorderSide(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),
              ),
              child: ListTile(
                trailing:IconButton(icon: Icon(Icons.list,color: Colors.grey,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ListScreen()));
                                 },
                ),
                leading: GestureDetector(
                    child: Image.asset('images/weather.png', height:30.0),
                onTap: ()async{
                  if (await canLaunch(url1))
                  await launch(url1);
                  else
                    throw 'Could not launch $url1';
                },),
              ),
            ),

            backgroundColor: Colors.transparent,
            body: Container(
              margin: EdgeInsets.only(top:30.0),
              child: Column(
                children: [
                  Center(
                    child: Text('${weatherInfo.country}',
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w400,


                      ) ,),
                  ),
                  Center(
                    child: Text('${weatherInfo.condition}'.inCaps,
                      style:TextStyle(
                        color:Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(
                    height:4.0,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height:10.0,
                          ),
                          Center(
                            child: Text('${weatherInfo.minTemperature}°',
                              style:TextStyle(
                                color:Colors.white,
                                fontSize: 60.0,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                          SizedBox(
                            height:10.0,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left:20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,// text of diff size on the same line
                              children: [
                                Text(
                                  DateFormat('EEEE').format(DateTime.now()),
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                  ) ,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'TODAY',
                                  style:TextStyle(
                                    color:Colors.white,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w500,


                                  ) ,
                                ),

                              ],
                             ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            width:MediaQuery.of(context).size.width ,
                            color: Colors.white38,
                            height: 1.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right:5.0),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child:
                              Row(
                                children:  listInRow,

                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width:MediaQuery.of(context).size.width ,
                            color: Colors.white38,
                            height: 1.0,
                          ),
                          Column(
                            children: listInColumn,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width:MediaQuery.of(context).size.width ,
                            color: Colors.white38,
                            height: 1.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20.0,top: 15.0),
                            child: Text("Today : ${weatherInfo.descriptionWeather.inCaps} currently.\n"
                                " It's ${weatherInfo.temperature} ° .",
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              height:1.5,

                            )),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Container(
                            width:MediaQuery.of(context).size.width ,
                            color: Colors.white38,
                            height: 1.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:20.0,top:3.0,right:20.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InfoCard('SUNRISE', '${weatherInfo.sunrise}'),
                                      KWightLine(),
                                      InfoCard('CHANCE OF RAIN', '${weatherInfo.chanceOfRain}%'),
                                      KWightLine(),
                                      InfoCard('WIND', '${weatherInfo.wind} Km/h'),
                                      KWightLine(),
                                      InfoCard('PRECIPITAION', '${weatherInfo.precipitation} cm'),
                                      KWightLine(),
                                      InfoCard('VISIBILITY', '${weatherInfo.visibility} Km'),
                                    ],
                                  ),
                                ),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InfoCard('SUNSET', '${weatherInfo.sunset}'),
                                      KWightLine(),
                                      InfoCard('HUMIDITY' , '${weatherInfo.humidity}%'),
                                      KWightLine(),
                                      InfoCard('FEELS LIKE', '${weatherInfo.feelsLike} ° '),
                                      KWightLine(),
                                      InfoCard('PRESSURE', '${weatherInfo.pressure} hPa '),
                                      KWightLine(),
                                      InfoCard('SEA LEVEL', '${weatherInfo.seaLevel} hPa '),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],),),),



                ],
              ),



            ),
          ),
        ),
      ],
    );

}







}
