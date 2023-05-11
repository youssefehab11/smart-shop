import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graduationproject/maps.dart';
import 'package:graduationproject/provider_controller.dart';
import 'package:graduationproject/test.dart';
import 'package:graduationproject/transition_animation.dart';

class Checkout extends StatelessWidget{

  late bool serviceLocation;
  late var locationPermission;

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
      body:Container(
        margin: const EdgeInsets.only(top: 20,left: 15,right: 15),
        width: double.infinity,
        height: 290,
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
                  //await provider.getLatAndLong();
                  provider.getPosition();
                  /* Future.delayed(Duration(seconds: 5),() {
                    Navigator.of(context).push(SlideLeftAnimationRoute(Page: Maps()));
                    print(provider.lat);
                  },); */
                  
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
              height: 70,
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
      ) ,
    );
  }

}