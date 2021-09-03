

class IconWeather {
  static String iconWeatherVertical(int id) {
    if (id > 199 && id <= 232)
      return '11d';
    if (id >= 300 && id <= 321)
      return '09d';
    if (id >= 500 && id <= 504)
      return '10d';
    if (id ==511)
      return ' 13d';
    if (id >= 520 && id <= 531)
      return '09d';
    if (id >= 600 && id <= 622)
      return '13d';
    if (id >= 701 && id <= 781)
      return '50d';
    if (id == 800) {

      return '01d';
    }
    if (id == 801) {

      return '02d';
    }
    if (id == 802) {

      return '03d';
    }
    if (id == 803 || id==804) {

      return '04d';
    }

return 'xxx';

  }
}