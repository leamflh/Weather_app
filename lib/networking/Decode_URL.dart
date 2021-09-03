
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/tools/constant.dart';


class DecodeURL {


  static Future<dynamic> decodeURL(Position position) async {
    LocationPermission permission = await Geolocator.checkPermission();
    print(permission);
    http.Response response=await http.get('$url?lat=${position.latitude}&lon=${position.longitude}&appid=$key&units=metric');
    if(response.statusCode==200){ // success
      var decodeData=jsonDecode(response.body); // getting the all the info about the current location's weather
      return decodeData;
    }
    else
      throw 'Something went wrong ${response.statusCode}';

  }

}