import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_art/data/weather_repo.dart';
import 'package:weather_art/models/country_response_model.dart';
import 'package:weather_art/providers/home_provider.dart';
import 'package:weather_art/utils/operation.dart';

mixin HomeHelper{
  BuildContext _authContext;

  doGetWeather(Dio dio, BuildContext context){
    _authContext = context;
    Provider.of<HomeProvider>(_authContext, listen: false).updateIsLoading(true);
    weatherRepo.getWeatherData(dio, _weatherDataCompleted);
  }

  _weatherDataCompleted(Operation operation){

    if(operation.code == 408 || operation.code == 508){
      //handle time out
      Provider.of<HomeProvider>(_authContext, listen: false).updateIsLoading(false);
      print('connection timed out');
    }else{
      WeatherResponseModel weatherResponse = operation.result;
      Provider.of<HomeProvider>(_authContext, listen: false).updateWeather(weatherResponse);

      Provider.of<HomeProvider>(_authContext, listen: false).updateIsLoading(false);

    }
  }
}