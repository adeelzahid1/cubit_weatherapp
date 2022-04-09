import 'package:cubit_weatherapp/cubits/temp_settings/temp_settings_cubit.dart';
import 'package:cubit_weatherapp/cubits/theme/theme_cubit.dart';
import 'package:cubit_weatherapp/cubits/weather/weather_cubit.dart';
import 'package:cubit_weatherapp/pages/home_page.dart';
import 'package:cubit_weatherapp/repositories/weather_repository.dart';
import 'package:cubit_weatherapp/services/weather_api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) => WeatherCubit(),
        ),
        BlocProvider<TempSettingsCubit>(
            create: (context) => TempSettingsCubit()),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
      ],
      child: BlocListener<WeatherCubit, WeatherState>(
        listener: (context, state) {
          context.read<ThemeCubit>().setTheme(state.weather.theTemp);
        },
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Weather App',
              debugShowCheckedModeBanner: false,
              theme: state.appTheme == AppTheme.light
                  ? ThemeData.light()
                  : ThemeData.dark(),
              home: HomePage(),
            );
          },
        ),
      ),
    );
  }
}
