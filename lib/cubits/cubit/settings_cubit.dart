import 'package:bloc/bloc.dart';
import 'package:cubit_weatherapp/models/weather.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  void weatherFound() {
    try {
      final weather = Weather(
          weatherStateName: 'State',
          weatherStateAbbr: 'state abr',
          created: 'created',
          minTemp: 33.3,
          maxTemp: 40,
          theTemp: 38,
          title: 'title',
          woeid: 1,
          lastUpdated: DateTime.now());

      emit(WeatherFound(weather));
    } catch (e) {
      emit(ErrorState('Weather can not be found at this time'));
    }
  }
}
