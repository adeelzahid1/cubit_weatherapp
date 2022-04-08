import 'package:cubit_weatherapp/cubits/weather/weather_cubit.dart';
import 'package:cubit_weatherapp/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
             onPressed: () async =>{
               _city = await Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage())),
                print(_city),
                if(_city!=null){
                  context.read<WeatherCubit>().fetchWeather(_city!),
                }
             },
             icon: Icon(Icons.search),
             )
        ]
      ),
    );
  }


}
