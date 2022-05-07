import 'package:flutter/material.dart';
import 'package:world_time/services/worldtime_api.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: "Germany", url: "Europe/Germany", flag: "germany.png"),
    WorldTime(location: "Egypt", url: "Africa/Egypt", flag: "egypt.png"),
    WorldTime(location: "Greece", url: "Europe/Greece", flag: "germany.png"),
    WorldTime(location: "Kenya", url: "Africa/Kenya", flag: "kenya.png"),
    WorldTime(location: "SouthKorea", url: "Asia/South-Korea", flag: "south_korea.png"),
    WorldTime(location: "Unitedkingdom", url: "Europe/United-Kingdom", flag: "uk.png"),
    WorldTime(location: "Belgium", url: "Europe/Belgium", flag: "belgium.jpg")];
  void updatetime(index)async{
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      "locations":instance.location,
      "flag":instance.flag,
      "time":instance.time,
      "isdaytime":instance.isdaytime,

    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: Text("set location"),
      centerTitle: true,
      backgroundColor: Colors.blue[900],),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
            child: Card(
              child: ListTile(
                onTap: (){updatetime(index);},
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("images/${locations[index].flag}"),
                ),
              ),
            ),
          );
        }

      )
    );
  }
}
