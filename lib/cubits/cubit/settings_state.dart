part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class WeatherFound extends SettingsState {
  final Weather weather;

  WeatherFound(this.weather);
}

class ErrorState extends SettingsState {
  final String error;

  ErrorState(this.error);
}
