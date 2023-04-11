import 'package:flutter/material.dart';

class test0 extends StatefulWidget{
  @override
  State<test0> createState() => _test0State();
}

class _test0State extends State<test0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed('test');
            },
            child: Center(child: Text("go to page 1")),
          ),
    );
    
  }
}