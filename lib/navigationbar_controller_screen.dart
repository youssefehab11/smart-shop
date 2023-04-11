import 'package:flutter/material.dart';
import 'package:graduationproject/category_screen.dart';
import 'package:graduationproject/theme_manager';

import 'main.dart';
import 'home_screen.dart';



class NavigationBarController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationBarControllerState();
  }
}

class NavigationBarControllerState extends State<NavigationBarController> {
  int selectedIndex = 0;
  List<Widget> navigationBarScreens = [
    HomePage(),
    CategoryScreen(),
    const Text(
      "Cart",
      style: TextStyle(fontSize: 30, color: Colors.black),
    ),
    const Text(
      "Profile",
      style: TextStyle(fontSize: 30, color: Colors.black),
    ),
    SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(onPressed: (){
        setState(() {
          selectedIndex = 2;
        });
      }, child:Icon(selectedIndex == 2 ? Icons.shopping_cart : Icons.shopping_cart_outlined,color: Theme.of(context).floatingActionButtonTheme.hoverColor)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          children: [
            Row(
              children: [MaterialButton(onPressed: (){
                setState(() {
                  selectedIndex = 0;
                });
              },child: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined,color:Theme.of(context).iconTheme.color,size: 30,),),
              MaterialButton(onPressed: (){
                setState(() {
                  selectedIndex = 1;
                });
              },child: Icon(selectedIndex == 1 ? Icons.category : Icons.category_outlined,color:Theme.of(context).iconTheme.color,size: 30,),),
              ],
            ),
            const Spacer(),
            Row(children: [
              MaterialButton(onPressed: (){
                setState(() {
                  selectedIndex = 3;
                });
              },child: Icon(selectedIndex == 3 ? Icons.person_rounded : Icons.person_outline_rounded,color:  Theme.of(context).iconTheme.color,size: 30,),),
              MaterialButton(onPressed: (){
                setState(() {
                  selectedIndex = 4;
                });
              },child: Icon(selectedIndex == 4 ? Icons.settings: Icons.settings_outlined,color:Theme.of(context).iconTheme.color,size: 30,),)
            ],)
          ],
        ),
      ),
      body: navigationBarScreens.elementAt(selectedIndex),
    );
  }
}




