
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/WeatherCardVertical.dart';
import 'package:weather_app/widgets/WeatherCardHorizontal.dart';

class Method{

  int getMinTemp(int min,int tmp){

    if(tmp<min)
      min=tmp;

    return min;
  }

  int getMaxTemp(int max,int tmp){
    if(tmp>max)
      max=tmp;

    return max;
  }

  int getMinId(int id,int idToAdd){
    if(id<idToAdd)
      idToAdd=id;
    return idToAdd;
  }

  static List<WeatherCardHorizontal> horizontalSlideList (Map<String,dynamic> parsedJson) {

    List<WeatherCardHorizontal> listOfCard=[];
    var integerTemperature;
    for (int i = 0; i < 10; i++) {
      String dateAsString = parsedJson['list'][i]['dt_txt'];
      DateTime date = DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateAsString);

      int id = parsedJson['list'][i]['weather'][0]['id'];
      var doubleTemperature = parsedJson['list'][i]['main']['temp'];
      try{
        integerTemperature = doubleTemperature.round();
      }catch(e10){
        integerTemperature=doubleTemperature;
        print(e10);
      }


      String icon=parsedJson['list'][i]['weather'][0]['icon'];

      listOfCard.add(WeatherCardHorizontal(date,id,integerTemperature,icon));



    }
    return listOfCard;
  }
  static List<WeatherCardVertical> verticalSlideList  (Map<String,dynamic> parsedJson) {

    List<WeatherCardVertical> listOfCard=[]; // we gonna add in it
    String now;  //current day of the user

    // initializing the variables
    int minTemp=100;
    int maxTemp=0;
    String check;
    int newIdToAdd=10000;


    DateTime stringToDate;
    String dayOfWeek; //Monday , tuesday..

    int id ;
    String dateAsString;

    var doubleTemperature;
    var temperature;


    String dateToAddAsString;
    DateTime dateToAdd;


    for (int i = 0; i < 40; i++) {

      now=DateFormat('EEEE').format(DateTime.now()); //returns the current day

      dateAsString = parsedJson['list'][i]['dt_txt']; //"2020-11-23 21:00:00"
      stringToDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateAsString); // convert string to DateTime
      dayOfWeek=DateFormat('EEEE').format(stringToDate); // Monday,Tuesday..

      id = parsedJson['list'][i]['weather'][0]['id'];
      doubleTemperature = parsedJson['list'][i]['main']['temp'];

      try{
        temperature = doubleTemperature.round();
      }
      catch(e8){
        temperature=doubleTemperature;
        print(e8);
      }


      // This procedure is to prevent dayOfWeek duplicate because the api gives us w new date each 3h
      // so it will result monday ,monday ,monday ... ,tuesday , tuesday..

      if(check==null) {
        // for example , we got 'Monday' for the first time
        check = dayOfWeek;
        minTemp=Method().getMinTemp(minTemp, temperature); // checking the min value of the temp
        maxTemp=Method().getMaxTemp(maxTemp,temperature); // checking the max value of the temp
        newIdToAdd=Method().getMinId(id, newIdToAdd); // checking the min id for the icon , because i want the minimum
        //id to display the icon , for example it's raining that day
        //i want to lowest id that gives me the info that it will be raining this day.
      }
      else{

        if(check==dayOfWeek){ // duplicate value
          minTemp=Method().getMinTemp(minTemp, temperature); // updating the value of the min temp
          maxTemp=Method().getMaxTemp(maxTemp,temperature); // ...
          newIdToAdd=Method().getMinId(id, newIdToAdd); // ...
        }
        else{
            // here , there's a change ,for example: Tuesday , check=Monday , so we have to clear check
            // and to add a widget to the card .

          dateToAddAsString = parsedJson['list'][i-1]['dt_txt']; // we want to add Monday , because now we have Tuesday
          // so we have to go to the previous one.
          dateToAdd = DateFormat("yyyy-MM-dd hh:mm:ss").parse(dateToAddAsString);

          listOfCard.add(WeatherCardVertical(dateToAdd,newIdToAdd,minTemp,maxTemp)); // adding to the list

          //re-initializing the variables
          check=dayOfWeek;
          minTemp=100;
          maxTemp=0;
        }

      }
      if(check==now){ // i dont want to put the recent day in this list , so i have to skip it every time i get it.
        check=null;
      }

    }
    listOfCard.add(WeatherCardVertical(stringToDate,newIdToAdd,minTemp,maxTemp));
    return listOfCard;
  }
}
