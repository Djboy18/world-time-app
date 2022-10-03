import 'package:flutter/material.dart';
import 'package:world_time/pages/choose_location.dart';
import 'package:world_time/pages/home_screen.dart';
import 'package:world_time/pages/loading_screen.dart';
import 'package:provider/provider.dart';
import 'package:world_time/services/worldtime_api.dart';


void main() {
  runApp( ChangeNotifierProvider(
    create: (_)=> WorldTimeProvider(),
    child: MaterialApp(
      initialRoute: '/home',
      routes: <String,WidgetBuilder>{
        '/home': ( context) => Home(),
        '/location':(context) => Location(),
      },
    ),
  ));
}
