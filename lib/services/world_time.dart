import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {

  late String location;
  late String time;
  late String flag;
  late String url;
  late bool isDayTime;

  //World Time constructor with named parameters
  WorldTime({ required this.location, required this.url, required this.flag});

  //Method to get the time data from the endpoint
  Future<void> getTime() async {
    try {
      //Get the API data
      String uri = 'http://worldtimeapi.org/api/timezone/$url';
      Response response = await http.get(Uri.parse(uri));
      //Convert the data to json
      Map data = jsonDecode(response.body);

      //Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      //Create date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      //Check whether its day time or night time
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      //Set the formatted time property
      time = DateFormat.jm().format(now);
    } catch(e) {
      time = 'Error when getting time data, check endpoint url and try again';
    }
  }
}

