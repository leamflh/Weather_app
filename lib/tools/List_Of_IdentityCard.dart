import 'package:flutter/material.dart';
const url = "https://weather.com/?Goto=Redirected";

class ListOfIdentityCard{
  // add to it the widgets
   static List<Widget> listOfCard=[
    ListTile(
      trailing: Builder(
        builder: (BuildContext context){
          return IconButton(icon: Icon(Icons.add_circle_outline,color: Colors.grey,size: 30.0,),

            onPressed: (){
              Navigator.pushNamed(context, 'Search Screen');
            },
          );
        },
      ),
      leading: GestureDetector(child: Text('°C/°F',style: TextStyle(color: Colors.black38),),
      onTap: (){
      //String unit= ${units='imperial'} ? 'metric' : 'imperial';
      },),
    ),
  ];
   // to prevent duplicated countries
   static List<String> listOfCountriesAdded=[];

}
