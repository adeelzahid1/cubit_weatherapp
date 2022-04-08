import 'package:cubit_weatherapp/models/weather.dart';
import 'package:cubit_weatherapp/repositories/weather_repository.dart';
import 'package:cubit_weatherapp/services/weather_api_service.dart';
import 'package:cubit_weatherapp/cubits/weather/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
@override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _fetchWeather() {
    context.read<WeatherCubit>().fetchWeather('london');
  }
}

  // @override
  // void initState() {
  //   print("Api Calling ");
  //   super.initState();
  // _fetchWeather();
  // }

  // _fetchWeather(){
  //   // WeatherRepository (weatherApiServices: WeatherApiServices(httpClient: http.Client())).fetchWeather('london');
    
  // }