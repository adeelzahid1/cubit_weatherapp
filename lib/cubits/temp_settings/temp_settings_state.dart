part of 'temp_settings_cubit.dart';

class TempSettingsState {
  final TempUnit tempUnit;
  const TempSettingsState({this.tempUnit = TempUnit.celsius});

  factory TempSettingsState.initial() {
    return TempSettingsState();
  }

  List<Object> get props => [tempUnit];

  TempSettingsState copyWith({
    TempUnit? tempUnit,
  }) {
    return TempSettingsState(
      tempUnit: tempUnit ?? this.tempUnit,
    );
  }

  bool get stringify => true;
}

enum TempUnit {
  celsius,
  fahrenheit,
}

// class WeatherFound extends WeatherState {}
