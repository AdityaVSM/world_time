import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  Future<void> setUpWorldTime() async {
    WorldTime worldTime = WorldTime(location: 'Berlin', flag_url: 'germany.png', url: 'Europe/Berlin');
    await worldTime.getTime();
    Navigator.pushReplacementNamed(context, '/home',arguments: {
      'time' : worldTime.time,
      'location' : worldTime.location,
      'flag'  :worldTime.flag_url
    });

  }
  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.all(50),
          child: Text('loading....')
      ),
    );
  }
}
