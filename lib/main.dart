import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_art/providers/app_provider.dart';
import 'package:weather_art/providers/home_provider.dart';
import 'package:weather_art/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => HomeProvider()),
      Provider(create: (_) => AppProvider()),
    ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}


