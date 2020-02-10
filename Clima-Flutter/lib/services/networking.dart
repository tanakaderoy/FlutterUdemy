//http://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22
//b6907d289e10d714a6e88b30761fae22
import 'dart:convert';

import 'package:clima/models/WeatherResponse.dart';
import 'package:clima/utilities/constants.dart';
import 'package:http/http.dart' as http;
class API{
  String baseURL = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherResponse> getWeather(double latitude, double longitude) async{
    String url = '$baseURL?lat=$latitude&lon=$longitude&appid=$kAPIKey';
    http.Response response = await http.get(url);

    if(response.statusCode == 200) {
      String data = response.body;
      Map weatherResponseMap = jsonDecode(data);
    WeatherResponse weatherResponse= WeatherResponse.fromJson(weatherResponseMap);
    return weatherResponse;
    }else{
    print(response.statusCode);
    return null;
    }

  }

  Future<WeatherResponse> getWeatherByCity(String city) async{
    String url = '$baseURL?q=$city&appid=$kAPIKey';
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      String data = response.body;
      Map weatherResponseMap = jsonDecode(data);
      WeatherResponse weatherResponse = WeatherResponse.fromJson(weatherResponseMap);
      return weatherResponse;
    }else{
      print(response.statusCode);
          return null;
    }

  }

}