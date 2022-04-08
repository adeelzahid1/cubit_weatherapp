import 'package:cubit_weatherapp/cubits/weather/weather_cubit.dart';
import 'package:cubit_weatherapp/pages/search_page.dart';
import 'package:cubit_weatherapp/widgets/error_dialog.dart';
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
        ],
      ),
      body: _showWeather(),
    );
  }


  Widget _showWeather(){
    return BlocConsumer<WeatherCubit, WeatherState>(
       listener: (context, state) {
         if(state.status == WeatherStatus.error){
           errorDialog(context, state.error.errMsg);
         }
       } ,
      builder: (context, state){
        if(state.status == WeatherStatus.initial){
          return Center(
            child: Text('Select a City', style: TextStyle(fontSize: 20.0),),
          );
        }
        if(state.status == WeatherStatus.loading){
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if(state.status == WeatherStatus.error){
          return Center(
            child: Text('Selct a City'),
          );
        }

      return Center(
        child: Text(state.weather.title, style: TextStyle(fontSize: 18.0),),
      );
      }
       );
  }

}
