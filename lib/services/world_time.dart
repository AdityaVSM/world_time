import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldTime{
  late String location; //location name from UI
  late String time; //the time in the location
  late String flag_url;  //url to asset flag icon
  late String url;//location url for api end point

  WorldTime({required this.location, required this.flag_url, required this.url});

  Future<void> getTime() async{
    //get data
    try {
      Uri url1 = Uri.parse("http://worldtimeapi.org/api/timezone/$url");
      Response response = await get(url1);
      Map data = jsonDecode(response.body);
      
      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'];
      
      //add offset to given time
      offset = offset.substring(1,3);
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset)));
      
      //set time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time="Could not get time data";
    }

  }
}

