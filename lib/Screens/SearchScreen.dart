import 'package:flutter/material.dart';
import 'package:weather_app/networking/Decode_URL_SearchScreen.dart';
import 'package:weather_app/Screens/Welcome_Screen.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        constraints:BoxConstraints.expand(),
        decoration:BoxDecoration(
          image:DecorationImage(
            image:AssetImage('images/beach.png'),
            fit:BoxFit.fill,


          ),
       ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/6,
              color: Colors.black38,
              child:SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:4.0),
                      child: Text('Enter the city of your choice.',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 10.0,
                      ),),
                    ),
                    SizedBox(
                      height: 14.0,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 7.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex:4,
                              child: Container(

                                height: 35.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.grey[850],
                                ),
                                child: TextField(
                                  obscureText: false,
                                  showCursor: true,
                                  cursorColor: Colors.white70,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left:6.0),
                                      child: Icon(Icons.search,
                                      color: Colors.white30,),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (value)async{
                                    var decodedData=await DecodeURLString.decodeURL(value);
                                    print(decodedData);
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen(decodedData)));

                                    },
                                )
                              ),
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Expanded(
                              flex:1,
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                child: Text('Cancel',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13.0,
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ),
          ],
        ),

        ),

    );
  }
}
