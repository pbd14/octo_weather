part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class LoadCityWeather extends WeatherEvent {
  final List<double> latlon;
  final String cityName;

  const LoadCityWeather({required this.latlon, required this.cityName});

  @override
  List<Object> get props => [latlon, cityName];
}
