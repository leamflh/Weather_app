import 'package:flutter/material.dart';
import 'package:weather_app/Screens/Welcome_Screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/networking/Get_Location.dart';



class LaunchingScreen extends StatefulWidget {
  


  @override
  _LaunchingScreenState createState() => _LaunchingScreenState();
}

class _LaunchingScreenState extends State<LaunchingScreen> {


  void fetchCurrentLocation() async{
    var decodedData=await GetLocation.getLocation();
    // the info about the current location's weather
    // The json file is converted to a string of weather info

    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen(decodedData)));
    // Navigating to the Welcome Page with decodedData as Argument

  }

  @override
  void initState()  {
    super.initState();
      fetchCurrentLocation(); // Start fetching for the current location the user is in .
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container( // Container contains : image as a background,
        // and a Spinkit to tell the user that he have to wait to the application to open.
        constraints:BoxConstraints.expand(),
        decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage('images/Launch.jpg'), // background image
            fit:BoxFit.fill,

          ),
        ),
        child: SpinKitThreeBounce(
          color: Colors.white, // color of the spinner
          size: 28.0, // size of the spinner
        ),
      ),
    );





  }
}

