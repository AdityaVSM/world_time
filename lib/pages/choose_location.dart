import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag_url: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag_url: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag_url: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag_url: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag_url: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag_url: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag_url: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag_url: 'indonesia.png'),
  ];

  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag_url,
      'time': instance.time,
      'isDaytime':instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Chhose location"),
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  //get data of that location
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag_url}'),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
