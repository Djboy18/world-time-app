import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};


  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ?data
        :ModalRoute.of(context)!.settings.arguments as Map;
    print(data);
    String BigImage = data['isDayTime'] ?  'day.jpg' : 'night.jpg';
    Color? bigColor = data['isDayTime'] ? Colors.blue : Colors.black;

    return Scaffold(
      backgroundColor: bigColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/$BigImage"),
              fit: BoxFit.cover
            )

          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                TextButton.icon(onPressed:  () async{
                  dynamic result = Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      "time": result["time"],
                      "location": result["location"],
                      "isdaytime": result["isdaytime"],
                      "flag": result["flags"]
                    };

                  });
                },
                    icon:Icon(Icons.edit_location,
                    color: Colors.yellow,),
                    label: Text("set location.")),
                SizedBox(height:20),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data["location"],
                      style: TextStyle(
                        fontSize: 35,
                        letterSpacing: 3,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(data["time"],
                style: TextStyle(
                  fontSize: 66
                ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
