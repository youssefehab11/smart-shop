
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:graduationproject/provider_controller.dart';
import 'package:graduationproject/test.dart';
import 'package:lottie/lottie.dart';

class test0 extends StatefulWidget{
  @override
  State<test0> createState() => _test0State();
}
class _test0State extends State<test0> {

  @override
  int selectedIndex = 1;

  List categories = ["Oil & Masala","Eggs, Meat & Fish","Beverages","Fruits & Veggies","Bakery","Snacks","Food Grains"];

  List<Widget> navigationBarScreens = [
    const Center(
      child:  Text(
        "1",
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    ),
    const Center(
      child:  Text(
        "2",
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    ),
    const Center(
      child:  Text(
        "3",
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    ),
    const Center(
      child:  Text(
        "4",
        style: TextStyle(fontSize: 30, color: Colors.black),
      ),
    ),

  ];

  int x = 1;
  List z = ["1,2,3"];

  

  @override
  Widget build(BuildContext context) {
    final provider = ProviderController.of(context);
    CollectionReference collectionReference = FirebaseFirestore.instance.collection("Categories").doc(provider.categoryId).collection("SubCategories");
     loading(){
      AwesomeDialog(
        context: context,
        dialogType: DialogType.noHeader,
        autoHide: const Duration(seconds: 3),
        barrierColor: Colors.black54,
        body: SizedBox(
          width: 150,
          height: 120,
          child: AnimatedSplashScreen(
            disableNavigation: true,
            splashIconSize: 500,
            splash: Lottie.asset("assets/lotties/1620-simple-dots-loading.json"),
            animationDuration:const Duration(seconds: 1),
            nextScreen: test0()),
            )
      ).show();
      
    }
    Widget tabBarView(){
      
      
        return FutureBuilder(
    future: collectionReference.get(),
    builder: (context, snapshot) {
     if(snapshot.hasData){
      return ListView.builder(
    itemCount: snapshot.data?.docs.length,
    itemBuilder: (context, index) {
     return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.grey,width: 2),
                    
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          /* onTap: () {
                            setState(() {
                              provider.title = provider.subCategories[index]["SubCategoryName"];
                              subCategory = provider.subCategories[index]["SubCategoryName"];
                              provider.getSubCategoryId(subCategory);
                              });
                              loadingItems();
                          }, */
                          child: Image.asset('assets/images/${snapshot.data?.docs[index]["Image"]}',fit: BoxFit.cover,)),
                      )
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(snapshot.data?.docs[index]["SubCategoryName"]),
              ),
              const SizedBox(
                height: 30,
              ),
              
            ],
          ),
        ],
      );
   },);
     }
     else if(snapshot.hasError){
      return Text("Error");
     }
     else{
      return Text("Loading");
     }
   },);
      
   
} 

    return  Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: "Poppins",fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          //elevation: 0.0,
        ),
      body: Stack(
      children: [
        Center(child: tabBarView(),),
        Container(
          width: 100,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  selectedIndex = 0;
                  
                   
                   
                  //Future.delayed(Duration(milliseconds:3100 ),
                    setState(() {
                     
                    //selectedIndex = 0;
                    provider.getCategoryId(categories[0]);
                  });
                  loading();
                    
                  
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 5,left: 5,right: 5),
                  child: Text(categories[0],style: const TextStyle(fontFamily: "Poppins",fontSize: 16)))
              ),
              InkWell(
                onTap: () {
                  selectedIndex = 1;
                  
                   loading();
                  Future.delayed(Duration(milliseconds:3100 ),() {
                    setState(() {
                    provider.getCategoryId(categories[1]);
                  
                    });
                    
                  },); 
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 15,left: 5,right: 5),
                  child: Text(categories[1],style: const TextStyle(fontFamily: "Poppins",fontSize: 16)))
              ),
              
            ],
          ),
        )
      ],
    ),
    );
  }
}