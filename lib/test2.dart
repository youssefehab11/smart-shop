import 'package:flutter/material.dart';

class test2 extends StatelessWidget{
  List list =[{"id":1,"name":"ali"},{"id":3,"name":"omar"},{"id":2,"name":"kareem"}];
  List list2 = [1,2,3,4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
    child: new Container(
      width: 100,
      height: 100,
      child: new Material(
        child: new InkWell(
          onTap: (){print("tapped");},
          child: new Container(
            width: 100.0,
            height: 100.0,
          ),
        ),
        color: Colors.transparent,
      ),
      color: Colors.orange,
    ),
  ),
    );
  }

}