/*import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  void setupworldtime() async{
     WorldTime instance = WorldTime(location: "Germany",url:"Europe/Germany",flag: "Germany.png");
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home',arguments:{
      'location': instance.location,
        "flag"  : instance.flag,
        "time": instance.time,
        "isdaytime":instance.isdaytime,
      }

      );


  }

  @override
  void initState() {
    super.initState();
    setupworldtime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SpinKitFadingCircle(
          color: Colors.yellow,
          size: 50.0,
        ),
      )
    );
  }
}
*/