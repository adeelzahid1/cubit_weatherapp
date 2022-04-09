part of 'weather_cubit.dart';

class WeatherState {
  final WeatherStatus status;
  final Weather weather;
  final CustomError error;
  const WeatherState({
    required this.status,
    required this.weather,
    required this.error,
  });

  factory WeatherState.initial() {
    return WeatherState(
        status: WeatherStatus.initial,
        weather: Weather.initial(),
        error: CustomError());
  }

  List<Object> get props => [status, weather, error];

  WeatherState copyWith({
    WeatherStatus? status,
    Weather? weather,
    CustomError? error,
  }) {
    return WeatherState(
      status: status ?? this.status,
      weather: weather ?? this.weather,
      error: error ?? this.error,
    );
  }

  bool get stringify => true;
}

enum WeatherStatus { initial, loaded, loading, error }
