import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:world_time/WorldTimeClass.dart';
class WorldTimeProvider with ChangeNotifier{
  String? _time;
  bool _isDayTime = false;
  bool get isDayTime =>_isDayTime;
  String? get time => _time;
  Future<void> getTime (WorldTime worldTime)async{
    try{
      Response response =  await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/${worldTime.url}'));
      Map<String,dynamic> data = jsonDecode(response.body);
      print(response.body);
      String datetime = data["datetime"];
      String offset = data["utc_offset"].substring(1,3);
      print(datetime);
      print(offset);
      DateTime now  = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      print(now);
      print(DateFormat.jm().format(now));
      //seting data and time property;
      _time = DateFormat.jm().format(now);
      _isDayTime = now.hour >= 6 && now.hour <19 ? true:false;

      notifyListeners();
    }catch (e){
      print("caught error: $e");
      _time = "couldn't get time data ";
    }
  }

}