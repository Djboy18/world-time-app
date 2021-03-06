import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home_screen.dart';
import 'package:world_time/pages/loading_screen.dart';



void main() {
  runApp( MaterialApp(
    initialRoute: '/home',
    routes: {
      '/' : ( context) => LoadingScreen(),
      '/home': (  context) => Home(),
      '/location':(context) => Location(),

    },
  ));
}
