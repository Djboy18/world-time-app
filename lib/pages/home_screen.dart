import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:world_time/Utils.dart';
import 'package:world_time/WorldTimeClass.dart';
import 'package:world_time/services/worldtime_api.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> data = {};
  WorldTime _worldTime =
      WorldTime(location: "Cairo", url: "Africa/Cairo", flag: "egypt.png");
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    context.read<WorldTimeProvider>().getTime(_worldTime);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    /*Map sed = ModalRoute.of(context)!.settings.arguments as Map;
    String locations = sed["location"];
    String flag = sed["flag"];
    String time = sed["time"];
    bool isdaytime = sed["isdaytime"];
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;*/
    String? time = Provider.of<WorldTimeProvider>(context).time;
    bool isdaytime = Provider.of<WorldTimeProvider>(context).isDayTime;
    String BigImage = isdaytime ? 'day.png' : 'nights.png';
    Color? bigColor = isdaytime ? Colors.blue : Colors.black;
    String countryLocation =
        data.isEmpty ? _worldTime.location : data["locations"];
    String countryFlag = data.isEmpty ? _worldTime.flag : data["flag"];
    return Scaffold(
      backgroundColor: bigColor,
      body: time == null
          ? Center(
             child: Loader(),
            )
          : SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/$BigImage"),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Column(
                    children: [
                      TextButton.icon(
                          onPressed: () async {
                            dynamic result =
                                await Navigator.pushNamed(context, "/location");
                            if(result != null){
                              print(result);
                              setState(() {
                                data = result;
                              });
                            }else{print(data);}
                          },
                          icon: Icon(
                            Icons.edit_location,
                            color: Colors.yellow,
                          ),
                          label: Text("set location.")),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage("images/${countryFlag}"),
                            fit: BoxFit.cover,
                            height: 50,
                            width: 50,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            countryLocation,
                            style: TextStyle(
                              fontSize: 35,
                              letterSpacing: 3,
                              color: isdaytime?Colors.black:Colors.white
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        time,
                        style: TextStyle(fontSize: 66,
                            color:isdaytime?Colors.black:Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
