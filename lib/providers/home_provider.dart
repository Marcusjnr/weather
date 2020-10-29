import 'package:flutter/foundation.dart';
import 'package:weather_art/models/country_response_model.dart';

class HomeProvider extends ChangeNotifier{
  bool isLoading = false;
  List<WeatherResponseModel> weatherList = [];
  WeatherResponseModel weatherResponse;

  void updateIsLoading(bool isLoadingGotten){
    isLoading = isLoadingGotten;
    notifyListeners();
  }

  void updateWeather(WeatherResponseModel weatherResponseGotten){
    weatherResponse = weatherResponseGotten;
  }
}