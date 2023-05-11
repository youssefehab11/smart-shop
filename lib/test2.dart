import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class test2 extends StatefulWidget{

  @override
  State<test2> createState() => _test2State();
}

class _test2State extends State<test2> {
var currentLocation;
var lat;

  getPosition()async{
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      lat = position.latitude;
    });
    print(lat);
    print(position.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: TextButton(onPressed: () async{
         await getPosition();
        
      }, child: Text("Get position")),)
    );
  }
}