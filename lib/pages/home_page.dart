import 'package:cubit_weatherapp/models/weather.dart';
import 'package:cubit_weatherapp/repositories/weather_repository.dart';
import 'package:cubit_weatherapp/services/weather_api_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    print("Api Calling ");
  _fetchWeather();
    super.initState();
  }

  _fetchWeather(){
    WeatherRepository (weatherApiServices: WeatherApiServices(httpClient: http.Client())).fetchWeather('london');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}