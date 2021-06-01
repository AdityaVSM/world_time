import 'dart:io';

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag_url: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag_url,
      'time': instance.time,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
        backgroundColor: Colors.blue[800],
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[600],
      body: Center(
        child: SpinKitRipple(
          color: Colors.white,
          size: 200.0,
        ),
      )
    );
  }
}