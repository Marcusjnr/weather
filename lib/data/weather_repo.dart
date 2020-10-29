import 'package:dio/dio.dart';
import 'package:weather_art/data/weather_data.dart';
import 'package:weather_art/utils/operation.dart';

class _WeatherRepo{
   getWeatherData(Dio dio, OperationCompleted countryDataCompleted){
      weatherData.getWeather(dio).then((data) => countryDataCompleted(data));
   }
}

_WeatherRepo weatherRepo = _WeatherRepo();