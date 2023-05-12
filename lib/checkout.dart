import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduationproject/provider_controller.dart';
import 'package:graduationproject/transition_animation.dart';
import 'package:lottie/lottie.dart' as loi;

class Checkout extends StatefulWidget{

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {

  var pickupLocation;

  void loading(){
      showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimatedSplashScreen(
            disableNavigation: true,
            splashIconSize: 150,
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
            splash:
                loi.Lottie.asset("assets/lotties/1620-simple-dots-loading.json"),
            animationDuration: const Duration(seconds: 1),
            nextScreen: Checkout());
      },
    );
      Future.delayed(const Duration(milliseconds: 4000),() {
        Navigator.pop(context);
        Navigator.of(context).push(SlideLeftAnimationRoute(Page: Maps()));
      },);
    }

    Widget checkSelectedLocation(){
      final provider = ProviderController.of(context);

      if(pickupLocation == null || pickupLocation == "Default location"){
        return Container();
      }
      else{
        return Container(
            margin: const EdgeInsets.only(top: 5,left: 15,right: 15,bottom: 15),
            width: double.infinity,
            //height: MediaQuery.of(context).size.height/2.7,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: Colors.grey),
              borderRadius: BorderRadius.circular(20)
              
            ),
            child: Column(children: [
              
              InkWell(
                onTap: () async{
                  serviceLocation = await Geolocator.isLocationServiceEnabled(); 
                  if(serviceLocation){
                    locationPermission = await Geolocator.checkPermission();
                    if(locationPermission == LocationPermission.denied){
                        await Geolocator.requestPermission();
                    }
                    if(locationPermission == LocationPermission.whileInUse || locationPermission == LocationPermission.always){
                      provider.getPosition();
                      loading();
                      
                    } 
                  }
                  else{
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.warning,
                      title: "Please activatie your service location first"
                      ).show();
                  }
                  
                },
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  child: Image.asset("assets/images/Maps.jpg",fit:BoxFit.cover,))),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      const Icon(Icons.location_on,color: Color.fromRGBO(198, 48, 48, 1),),
                      const SizedBox(width: 5,),
                      Text("Mark your pickup location",style: Theme.of(context).textTheme.headline4,)
                    ]),
                  ),
                )
            ],),
          );
      }
    }

    Widget setAddress(){
      var user = FirebaseAuth.instance.currentUser;
      DocumentReference userref = FirebaseFirestore.instance.collection("users").doc(user!.uid);
      if(pickupLocation == null){
        return const SizedBox(
          height: 50,
          width: double.infinity,
          child: Center(child: Text("No address yet!")));
      }
      else if(pickupLocation == "Default location"){
        return  StreamBuilder(
            stream: userref.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(snapshot.data!["Default Country"] == ""){
                  return const SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Center(child: Text("No address yet!")));
                }
                else{
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(),
                      Padding(
                        padding: const EdgeInsets.only(top:25,left: 8),
                        child: Text("Name: ${snapshot.data!["First Name"]} ${snapshot.data!["Last Name"]}",
                          style:Theme.of(context).textTheme.bodyText1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8,left: 8),
                        child: Text("${snapshot.data!["Default Country"]}, ${snapshot.data!["Default City"]}",
                        style:Theme.of(context).textTheme.bodyText1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("${snapshot.data!["Default Subcity"]}, ${snapshot.data!["Default Thoroughfare"]}, ${snapshot.data!["Default Street"]}",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyText1
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 8,bottom: 25),
                        child: Text("Phone Number: ${snapshot.data!["Phone Number"]}",
                          style:Theme.of(context).textTheme.bodyText1),
                      ),
                      ],);
                }
                
                  } else {
                    return const Text("");
                  }
          },);
      }
      else{
          return StreamBuilder(
            stream: userref.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if(snapshot.data!["Custom Country"] == ""){
                  return const SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Center(child: Text("No address yet!")));
                }
                else{
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(),
                      Padding(
                        padding: const EdgeInsets.only(top:25,left: 8),
                        child: Text("Name: ${snapshot.data!["First Name"]} ${snapshot.data!["Last Name"]}",
                          style:Theme.of(context).textTheme.bodyText1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8,left: 8),
                        child: Text("${snapshot.data!["Custom Country"]}, ${snapshot.data!["Custom City"]}",
                        style:Theme.of(context).textTheme.bodyText1),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text("${snapshot.data!["Custom Subcity"]}, ${snapshot.data!["Custom Thoroughfare"]}, ${snapshot.data!["Custom Street"]}",
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyText1
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0,left: 8,bottom: 25),
                        child: Text("Phone Number: ${snapshot.data!["Phone Number"]}",
                          style:Theme.of(context).textTheme.bodyText1),
                      ),
                      ],);
                }
                
                  } else {
                    return const Text("");
                  }
          },);
      }
    }

  late bool serviceLocation;
  late var locationPermission;

  //late CameraPosition kGooglePlex;

  @override
  Widget build(BuildContext context) {
    final provider = ProviderController.of(context);
    return Scaffold(
      appBar:AppBar(
        title: const Text(
          "Checkout",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            ),
      body:ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            width: double.infinity,
            height: 30,
            color: Theme.of(context).colorScheme.onBackground,
            child: const Text(
              "Delivery",
              style: TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.bold,
               fontFamily: "Lato",),
            )
          ),
          Card(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                Text("Default location",style: Theme.of(context).textTheme.bodyText1,),
                const Spacer(),
                Radio(value: "Default location", groupValue: pickupLocation, onChanged: (value) {
                    setState(() {
                      pickupLocation = value;
                    });
                },)
            ],),
              ),
             const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child:  Text("Default address will take the saved address in your profile"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(height: 1,width: double.infinity,color: Theme.of(context).colorScheme.onBackground,),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(children: [
              Text("Custom location",style: Theme.of(context).textTheme.bodyText1,),
              const Spacer(),
              Radio(value: "Custom location", groupValue: pickupLocation, onChanged: (value) {
                setState(() {
                  pickupLocation = value;
                });
              },)
            ],),
          ),
          checkSelectedLocation(),
          Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            width: double.infinity,
            height: 30,
            color: Theme.of(context).colorScheme.onBackground,
            child: const Text(
              "Address details",
              style: TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.bold,
               fontFamily: "Lato",),
            )
          ),
          setAddress(),
            ],),
          ),
          
          
        ],
      ) ,
    );
  }
}
class Maps extends StatefulWidget{
  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  
  late GoogleMapController gmc;
  Set<Marker> currentLocation = {
    
  }; 
  List<Placemark> placemarks=[];

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser;
    DocumentReference userref = FirebaseFirestore.instance.collection("users").doc(user!.uid);
    final provider = ProviderController.of(context);
/*     lat = provider.lat;
    lng = provider.long;
    provider.long; */
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Maps",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold),
            ),      
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {
                Future.delayed(const Duration(milliseconds: 800),() {
                if(placemarks.isEmpty){
                  Fluttertoast.showToast(
                    msg: "Please mark your address first",
                    backgroundColor: Colors.black54,
                    toastLength:Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM
                  );
                }
                else{
                  userref.update({"Custom Country":placemarks[0].country});
                  userref.update({"Custom City":placemarks[0].administrativeArea});
                  userref.update({"Custom Subcity":placemarks[0].subAdministrativeArea});
                  userref.update({"Custom Street":placemarks[0].street});
                  userref.update({"Custom Thoroughfare":placemarks[0].thoroughfare});
                  Fluttertoast.showToast(
                    msg: "Successfully added",
                    backgroundColor: Colors.black54,
                    toastLength:Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM
                  ); 
                  Navigator.of(context).pop();
                }
                },);
              }, icon: const Icon(Icons.check))
            ],
          ),
      body:SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GoogleMap(
          mapType: MapType.normal,
          zoomControlsEnabled: false,
          initialCameraPosition:const CameraPosition(
            target: LatLng(30.044420, 31.235712),
            zoom: 8,),
          onMapCreated: (GoogleMapController controller) {
            gmc = controller;
          },
          markers: currentLocation,  
          onTap:(argument) async{
            setState(() {
              currentLocation.remove(const Marker(markerId: MarkerId("1")));
              currentLocation.add(Marker(markerId: const MarkerId("1"),position: LatLng(argument.latitude, argument.longitude)));
            });
            placemarks = await placemarkFromCoordinates(argument.latitude,argument.longitude);
            /* provider.customAddress.addAll({
              "country":placemarks[0].country,
              "administrativeArea":placemarks[0].administrativeArea,
            }); */
            //print(provider.customAddress);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
         gmc.animateCamera(
          CameraUpdate.newCameraPosition( CameraPosition(
            target: LatLng(provider.currentLocation.latitude, provider.currentLocation.longitude),zoom:14.4746 )));
      },
      backgroundColor: Colors.white,
      child: const Icon(Icons.location_searching_rounded,size: 30,),
      ),
    );
    
  }
}