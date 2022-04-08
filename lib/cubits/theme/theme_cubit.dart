import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cubit_weatherapp/constants/constants.dart';
import 'package:cubit_weatherapp/cubits/weather/weather_cubit.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  late final StreamSubscription weatherSubscription;
  final WeatherCubit weatherCubit;
  ThemeCubit({required this.weatherCubit}) : super(ThemeState.initial()) {
    weatherSubscription =
        weatherCubit.stream.listen((WeatherState weatherState) {
      print('Weather State ${weatherState}');

      if (weatherState.weather.theTemp > kWarmOrNot) {
        emit(state.copyWith(appTheme: AppTheme.light));
      } else {
        emit(state.copyWith(appTheme: AppTheme.dark));
      }
    });
  }

  @override
  Future<void> close() {
    weatherSubscription.cancel();
    return super.close();
  }
}
