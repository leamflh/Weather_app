import 'package:intl/intl.dart';


String readTimestamp(int timestamp) {

  var format = DateFormat('HH:mm a');
  DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    var  time = format.format(date);



  return time;
}