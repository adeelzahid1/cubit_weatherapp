import 'package:bloc/bloc.dart';
import 'package:cubit_weatherapp/models/custom_error.dart';
import 'package:cubit_weatherapp/models/weather.dart';
import 'package:cubit_weatherapp/network/repo/weather_repo.dart';
import 'package:cubit_weatherapp/repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherState.initial()) {
    _repo = WeatherRepo();
  }

  late WeatherRepo _repo;

  Future fetchWeather(String city) async {
    try {
      final weather = _repo.fetchWeather(city);
      emit(WeatherFound(weather));
    } catch (e) {
      emit(ErrorState(e));
    }
  }
}
