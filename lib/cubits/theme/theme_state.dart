part of 'theme_cubit.dart';

class ThemeState  {
   final AppTheme appTheme;
  const ThemeState({this.appTheme = AppTheme.light});

factory ThemeState.initial(){
  return ThemeState();
}


  List<Object> get props => [appTheme];

  ThemeState copyWith({
    AppTheme? appTheme,
  }) {
    return ThemeState(
      appTheme: appTheme ?? this.appTheme,
    );
  }


  bool get stringify => true;
}

enum AppTheme{
  dark, light
}
