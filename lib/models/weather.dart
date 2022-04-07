import 'dart:convert';

class Weather {

  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String title;
  final int woeid;
  Weather({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.title,
    required this.woeid,
  });



  Weather copyWith({
    String? weatherStateName,
    String? weatherStateAbbr,
    String? created,
    double? minTemp,
    double? maxTemp,
    double? theTemp,
    String? title,
    int? woeid,
  }) {
    return Weather(
      weatherStateName: weatherStateName ?? this.weatherStateName,
      weatherStateAbbr: weatherStateAbbr ?? this.weatherStateAbbr,
      created: created ?? this.created,
      minTemp: minTemp ?? this.minTemp,
      maxTemp: maxTemp ?? this.maxTemp,
      theTemp: theTemp ?? this.theTemp,
      title: title ?? this.title,
      woeid: woeid ?? this.woeid,
    );
  }





  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'weatherStateName': weatherStateName});
    result.addAll({'weatherStateAbbr': weatherStateAbbr});
    result.addAll({'created': created});
    result.addAll({'minTemp': minTemp});
    result.addAll({'maxTemp': maxTemp});
    result.addAll({'theTemp': theTemp});
    result.addAll({'title': title});
    result.addAll({'woeid': woeid});
  
    return result;
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      weatherStateName: map['weatherStateName'] ?? '',
      weatherStateAbbr: map['weatherStateAbbr'] ?? '',
      created: map['created'] ?? '',
      minTemp: map['minTemp']?.toDouble() ?? 0.0,
      maxTemp: map['maxTemp']?.toDouble() ?? 0.0,
      theTemp: map['theTemp']?.toDouble() ?? 0.0,
      title: map['title'] ?? '',
      woeid: map['woeid']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source));


  @override
  String toString() {
    return 'Weather(weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, created: $created, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, title: $title, woeid: $woeid)';
  }
}
