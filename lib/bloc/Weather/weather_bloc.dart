import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<LoadCityWeather>((event, emit) async {
      Response response;
      var dio = Dio();
      response = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=${event.latlon[0]}&lon=${event.latlon[1]}&appid=c8c992e70c8d46a905a3f2eb692a87cd');
      print("WeatherFd");
      print(response.data.toString());

      emit(WeatherLoaded(weatherData: response.data, cityName: event.cityName));
    });
  }
}
