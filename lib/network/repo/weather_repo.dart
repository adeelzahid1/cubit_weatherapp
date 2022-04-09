import 'package:cubit_weatherapp/models/weather.dart';
import 'package:cubit_weatherapp/network/data_src/weather_data_src.dart';

abstract class IWeatherRepo {
  Future<Weather> fetchWeather(location);
}

class WeatherRepo implements IWeatherRepo {
  WeatherRepo() {
    _dataSrc = WeatherDataSrc();
  }

  late WeatherDataSrc _dataSrc;

  @override
  Future<Weather> fetchWeather(location) async {
    final res = await _dataSrc.fetchWeather(location);
    if (res.data['success'] as bool) return res;
    final msg = res.data['msg'] as String;
    throw Exception(msg);
  }
}
