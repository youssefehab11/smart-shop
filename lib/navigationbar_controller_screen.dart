import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/category_screen.dart';
import 'package:graduationproject/subcategory_items.dart';
import 'package:graduationproject/test2.dart';
import 'package:graduationproject/theme_manager';
import 'package:graduationproject/provider_controller.dart';
import 'package:graduationproject/transition_animation.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


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

    final provider = ProviderController.of(context);

    void loading(int value){
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimatedSplashScreen(
            disableNavigation: true,
            splashIconSize: 150,
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            splash:
                Lottie.asset("assets/lotties/1620-simple-dots-loading.json"),
            animationDuration: const Duration(seconds: 1),
            nextScreen: CategoryScreen());
      },
    );
      Future.delayed(const Duration(milliseconds:3500 ),() {
        Navigator.pop(context);
         setState(() {
           selectedIndex = value;
         });
        },); 
    }

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
                //provider.x.clear();
                //print(provider.x);
                provider.flag = 0;
                loading(0);
              },child: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined,color:Theme.of(context).iconTheme.color,size: 30,),),
              MaterialButton(onPressed: (){
                //provider.x=[{"Name":"Masalas","Image":"Masalas.jpg"},{"Name":"Spices","Image":"Spices.jpg"},{"Name":"Edible Oil & Ghee","Image":"Oil&Ghee.jpg"}];
                //print(provider.x);
                provider.flag = 1;
                provider.category = "Oil & Masala";
                provider.getCategoryId(provider.category);
                provider.selectedCategoryBackGroundColor.clear();
                provider.selectedCategoryLableColor.clear();
                provider.selectedCategoryBackGroundColor.add(true);
                provider.selectedCategoryLableColor.add(true);
                loading(1);
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




