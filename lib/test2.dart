import'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class test2 extends StatefulWidget{
  @override
  State<test2> createState() => _testState();
}

class _testState extends State<test2> {
  var name = "";
  getPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      name = prefs.getString('items')!;
      print(name);
    }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    /* appBar: AppBar(
      title: Text("test 2"),
    ),
    body: Column(
    children: [
      MaterialButton(onPressed: ()async{
        await getPrefs();
      },
      child: Text("get"),
      ), 
    ],
   ), */
   );
  }
}