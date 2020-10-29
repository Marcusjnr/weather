import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_art/mixin/home_helper.dart';
import 'package:weather_art/providers/app_provider.dart';
import 'package:weather_art/providers/home_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeHelper{

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      doGetWeather(
          Provider.of<AppProvider>(context, listen: false).dio,
          context
      );
    });

  }
  @override
  Widget build(BuildContext context) {
    return Consumer(
        builder: (BuildContext context, HomeProvider homeProvider, Widget child){
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: decideLayout(homeProvider),
            ),
          );
        }
    );
  }

  Widget decideLayout(HomeProvider homeProvider){
    if(homeProvider.isLoading){
      return Center(
        child: CircularProgressIndicator(),
      );
    }else if(homeProvider.isLoading == false && homeProvider.weatherResponse == null){
      return Center(
        child: Text(
          'Null',
          style: TextStyle(
              fontSize: 14
          ),
        ),
      );
    }else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Weather in Lagos',
            style: TextStyle(
                fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            'Looks Like ${homeProvider.weatherResponse.weather[0].main}',
            style: TextStyle(
                fontSize: 14
            ),
          ),

          Text(
            'Description ${homeProvider.weatherResponse.weather[0].description}',
            style: TextStyle(
                fontSize: 14
            ),
          ),

          Text(
            'Temp ${homeProvider.weatherResponse.main.temp.toString()}',
            style: TextStyle(
                fontSize: 14
            ),
          ),
        ],
      );
    }
  }
}
