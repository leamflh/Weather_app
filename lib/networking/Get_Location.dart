
import 'package:geolocator/geolocator.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/weather_app/lib/networking/Decode_URL.dart';


class GetLocation{

 static Future<dynamic> getLocation() async{

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    // Got the position(longitude and latitude) of the current location of the user

    return  DecodeURL.decodeURL(position);

  }

}