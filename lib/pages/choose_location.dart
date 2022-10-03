import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:world_time/WorldTimeClass.dart';
import 'package:world_time/services/worldtime_api.dart';
class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> locations = [
    WorldTime(location: "Berlin", url: "Europe/Berlin", flag: "germany.png"),
    WorldTime(location: "Cairo", url: "Africa/Cairo", flag: "egypt.png"),
    WorldTime(location: "Greece", url: "Africa/Lagos", flag: "germany.png"),
    WorldTime(location: "Nairobi", url: "Africa/Nairobi", flag: "kenya.png"),
    WorldTime(location: "Seoul", url: "Asia/Seoul", flag: "south_korea.png"),
    WorldTime(location: "London", url: "Europe/London", flag: "uk.png"),
    WorldTime(location: "Belgium", url: "Europe/Brussels", flag: "belgium.jpg")];
  void updatetime(index,BuildContext context)async{
    WorldTime instance = locations[index];
    Provider.of<WorldTimeProvider>(context,listen: false).getTime(instance);
    Navigator.pop(context, {
      "locations":instance.location,
      "flag":instance.flag,
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
                onTap: () => updatetime(index,context),
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
