part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Map weatherData;
  final String cityName;

  WeatherLoaded({required this.weatherData, required this.cityName});

  @override
  List<Object> get props => [weatherData, cityName];
}
