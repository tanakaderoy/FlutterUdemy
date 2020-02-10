import 'dart:convert';

import 'package:clima/models/WeatherResponse.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherResponse weather;
  Location location = Location();
  API api = API();
  WeatherModel weatherModel = WeatherModel();

  void getLocationWeatherData() async {
    weather = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(weather)));
  }





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(color: Colors.white,size: 100,)
      ),
    );
  }
}
