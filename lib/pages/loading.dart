import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async{
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}
