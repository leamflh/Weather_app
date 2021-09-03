
String getDate(DateTime date){
  if(date.hour>13){
    int newDate=date.hour-12;
    return '$newDate PM';
  }
  else {
    if (date.hour == 00)
      return '12 AM';
    else
      return '${date.hour} AM';
  }
}