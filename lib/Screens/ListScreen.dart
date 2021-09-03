import 'package:flutter/material.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/weather_app/lib/tools/List_Of_IdentityCard.dart';

class ListScreen extends StatefulWidget {


  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {


  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      body:Container(
        constraints:BoxConstraints.expand(),
        decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage('images/beach.png'),
            fit:BoxFit.fill,

          ),

        ),
        child: SingleChildScrollView(
          child: Column(
            children: ListOfIdentityCard.listOfCard,
          ),
        ),
      ),
    );

  }
}


