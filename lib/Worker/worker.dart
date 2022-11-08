import 'package:http/http.dart' as http;
import 'dart:convert';

class workers {
  late String location;

  workers({required this.location}) {
    location = this.location;
  }

  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  Future<void> getData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=73e4a3a5ff341a40576e14aa56c48fa9"));
      Map data = jsonDecode(response.body);

      // getting Temp, Humidity
      Map temp_data = data['main'];
      String getHumidity = temp_data['humidity'].toString();
      double getTemp = temp_data['temp'] - 273.15;

      // Getting Air Speed
      Map wind = data['wind'];
      double get_air_speed = wind['speed'] / 0.27777777777778;

      //Getting Description
      List weather = data['weather'];
      Map weather_main_data = weather[0];
      String get_main_des = weather_main_data['main'];
      String get_desc = weather_main_data["description"];
      String iconData = weather_main_data["icon"].toString();

      temp = getTemp.toString();
      humidity = getHumidity;
      air_speed = get_air_speed.toString();
      description = get_desc;
      main = get_main_des;
      icon = iconData;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't find Data!";
      main = "NA";
      icon = "03n";
    }
  }
}
