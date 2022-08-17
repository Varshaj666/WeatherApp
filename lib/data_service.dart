import 'dart:convert';

import 'package:http/http.dart' as http;
import 'models.dart';

//class used to access api and get weather Info
class DataService{
  Future<WeatherResponse> getWeather(String city) async{
    final queryParametersForecast = {'q': city,'days': '4' , 'key': 'c01ac7984e07464ab38180806222207'};
    final uriForecast=Uri.https('api.weatherapi.com', 'v1/forecast.json',queryParametersForecast);
    final response =await http.get(uriForecast);
    final json= jsonDecode(response.body);

    return WeatherResponse.fromJson(json);        //weather response class from models.dart is accessed to parse data

  }
}