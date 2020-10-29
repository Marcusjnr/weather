
import 'package:dio/dio.dart';
import 'package:weather_art/models/country_response_model.dart';
import 'package:weather_art/utils/operation.dart';

class WeatherData{
  Future<Operation> getWeather(Dio dio) async{

    try{
      var response = await dio.get(
          'http://api.openweathermap.org/data/2.5/weather?q=lagos&appid=25e5dff10d2289caad19b034748e8c23',

      ).timeout(Duration(minutes: 2), onTimeout: () async{
        return Response(
            data: {"message": "Connection Timed out. Please try again"},
            statusCode: 408);
      }).catchError((error) {
        return Response(
            data: {"message": "Error occurred while connecting to server"},
            statusCode: 508);
      });

      print(response.data);
      if(response.statusCode == 508 || response.statusCode == 408){
        return Operation(response.statusCode, response.data);
      }else{

        WeatherResponseModel data = WeatherResponseModel.fromJson(response.data);

        return Operation(response.statusCode, data);
      }

    }catch(err){
      print(err);
      if(err.response != null){
        print("err data : ${err.response.data}: error code ${err.response.statusCode} error : ${err.response}");
        return Operation(err.response.statusCode, err.response.data);
      }else{
        print("err data : ${err.message}: error ${err.error}");
        return Operation(500,'Network Error: please check your internet connect');
      }
    }
  }

}

final weatherData = WeatherData();