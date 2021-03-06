import 'dart:convert';
import 'dart:ui';

class Weather {
  final String weatherStateName;
  final String weatherStateAbbr;
  final String created;
  final double minTemp;
  final double maxTemp;
  final double theTemp;
  final String? title;
  final int woeid;
  final DateTime lastUpdated;
  Weather({
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.created,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    this.title,
    required this.woeid,
    required this.lastUpdated,
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
    DateTime? lastUpdated,
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
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weatherStateName': weatherStateName,
      'weatherStateAbbr': weatherStateAbbr,
      'created': created,
      'minTemp': minTemp,
      'maxTemp': maxTemp,
      'theTemp': theTemp,
      'title': title,
      'woeid': woeid,
      'lastUpdated': lastUpdated.millisecondsSinceEpoch,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      weatherStateName: map['weatherStateName'] ?? '',
      weatherStateAbbr: map['weatherStateAbbr'] ?? '',
      created: map['created'] ?? '',
      minTemp: map['minTemp']?.toDouble() ?? 0.0,
      maxTemp: map['maxTemp']?.toDouble() ?? 0.0,
      theTemp: map['theTemp']?.toDouble() ?? 0.0,
      title: map['title'],
      woeid: map['woeid']?.toInt() ?? 0,
      lastUpdated: DateTime.fromMillisecondsSinceEpoch(map['lastUpdated']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Weather(weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, created: $created, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, title: $title, woeid: $woeid, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Weather &&
        other.weatherStateName == weatherStateName &&
        other.weatherStateAbbr == weatherStateAbbr &&
        other.created == created &&
        other.minTemp == minTemp &&
        other.maxTemp == maxTemp &&
        other.theTemp == theTemp &&
        other.title == title &&
        other.woeid == woeid &&
        other.lastUpdated == lastUpdated;
  }

  @override
  int get hashCode {
    return hashList([
      weatherStateName,
      weatherStateAbbr,
      created,
      minTemp,
      maxTemp,
      theTemp,
      title,
      woeid,
      lastUpdated,
    ]);
  }
}
