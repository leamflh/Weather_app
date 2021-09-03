import 'package:http/http.dart' as http;

import 'dart:convert';

const key='34f1bff248c1df3f763edb1edc1323b1';
const url='http://api.openweathermap.org/data/2.5/forecast';

class DecodeURLString {

  static Future<dynamic> decodeURL(String position) async {

    http.Response response=await http.get(
        '$url?q=$position&appid=$key&units=metric');
    if(response.statusCode==200){ // success
      var decodeData=jsonDecode(response.body);
      // getting the all the info about the current location's weather
      return decodeData;
    }
    else
      throw 'Something went wrong ${response.statusCode}';

  }

}