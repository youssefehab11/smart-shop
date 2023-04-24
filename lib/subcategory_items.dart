import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/provider_controller.dart';
import 'package:graduationproject/transition_animation.dart';
import 'package:lottie/lottie.dart';

import 'item_details.dart';

class SubCategoryItems extends StatefulWidget{
  @override
  State<SubCategoryItems> createState() => SubCategoryItemsState();
}

class SubCategoryItemsState extends State<SubCategoryItems> {
  
  List<bool> recommendationliked = [];

  void loadingItem() {
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
            nextScreen: itemDetails());
      },
    );
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        Navigator.pop(context);
        Navigator.of(context)
            .push(SlideLeftAnimationRoute(Page: itemDetails()));
      },
    );
  }


  Widget checkIemDiscount(int index){
    final provider = ProviderController.of(context);
    if(provider.items[index]["Discount"] == 0){
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:8.0,top: 5),
            child: Text("${provider.items[index]["Price"] } EGP",
            style: Theme.of(context).textTheme.headline4,),
            ),
        ],
      );
    }
    else{
      double value = double.parse((provider.items[index]["Price"]-(provider.items[index]["Price"] * provider.items[index]["Discount"]/100)).toStringAsFixed(2));
      return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text("${provider.items[index]["Price"] } EGP",
                style: const TextStyle(fontFamily: "Lato",fontSize: 15,decoration: TextDecoration.lineThrough),),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:8.0,top: 2),
                child: Text("$value EGP",
                style: Theme.of(context).textTheme.headline4,softWrap: true,),
              ),
            ],
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    
    final provider = ProviderController.of(context);
    

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: InkWell(onTap: () {
            provider.items.clear();
            //provider.subCategories.clear();
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_rounded),
          ),
          title:  Text(
            provider.subCategoryTitle,
            style: const TextStyle(color: Colors.white, fontSize: 25,fontFamily: "Poppins",fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          //elevation: 0.0,
        ),
        body: GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 320),

                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  for(int i = 0;i<provider.items.length;i++){
                    recommendationliked.add(false);
                  }
                  return InkWell(
                    onTap: () {
                      provider.itemName = provider.usedItems[index]["Item Name"];
                      provider.getItemId(provider.itemName);
                      loadingItem();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: 150,
                      decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).colorScheme.onPrimary,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1,
                                      offset: const Offset(1.5, 1.5),
                                      spreadRadius: 0.5,
                                      color: Theme.of(context).shadowColor)
                                ]),
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          image: DecorationImage(
                                              image: AssetImage('assets/images/${provider.items[index]["Image"]}'),
                                              fit: BoxFit.cover)),
                                    ),
                                    /* Padding(
                                      padding: const EdgeInsets.only(left: 10,top: 10),
                                      child: Text(
                                          provider.items[index]["Quantity"] > 0?"":"Out of stock",
                                          style: TextStyle(fontSize: 14,color: Colors.red),
                                        ),
                                    ) */Positioned(
                                      
                                      child: Container(
                                        color: Theme.of(context).colorScheme.onSecondaryContainer,
                                        child:provider.items[index]["Discount"] > 0 ?  Text(
                                              " - ${provider.items[index]["Discount"]}%",
                                              style:Theme.of(context).textTheme.subtitle1 
                                            ):Container()
                                      ),
                                    ),
                                    Positioned(
                                      left: 74,
                                      top: 145,
                                      child: Text(
                                            provider.items[index]["Quantity"] > 0?"":"Out of stock",
                                            style: const TextStyle(fontSize: 14,color: Color.fromRGBO(198, 48, 48, 1)),
                                          ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only( top:8,left: 5,right: 5),
                                  child: Text(
                                            provider.items[index]["Description"],
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
                                                maxLines: 2,
                                          ),
                                ),
                                /* Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0,top: 5),
                                      child: Text(
                                              "${provider.items[index]["Price"]} EGP",
                                              style: Theme.of(context).textTheme.headline4,
                                            ),
                                    ),
                                  ],
                                ), */
                                checkIemDiscount(index),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  MaterialButton(onPressed: () {
                                  
                                },
                                color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                                textColor: Colors.white,
                                child: const Text("Add to cart",style: TextStyle(fontFamily: "Lato",fontSize: 17),),
                                ),
                                //const SizedBox(width: 10,),
                                IconButton(onPressed: (() {
                                  setState(() {
                                    recommendationliked[index] = !recommendationliked[index];
                                  });
                                })
                                , icon:Icon(recommendationliked[index] == false? Icons.favorite_border_outlined:Icons.favorite,color: const Color.fromRGBO(198, 48, 48, 1),size: 30,) )
                                ],)
                                
                                ]
                      
                    ),
                  ));
                },
              ),
    );
  }
}

/* InkWell(
                          onTap: () {},
                          child: Container(
                            width: 170,
                            height: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Theme.of(context).colorScheme.onPrimary,
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1,
                                      offset: const Offset(1.5, 1.5),
                                      spreadRadius: 0.5,
                                      color: Theme.of(context).shadowColor)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/${provider.items[index]["Image"]}'),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 15,right: 8,bottom: 5),
                                  child: SizedBox(
                                    width: 150,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          provider.items[index]["Description"],
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${provider.items[index]["Price"]} EGP",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                       provider.items[index]["Quantity"]>0 ? const EdgeInsets.all(0):const EdgeInsets.only(left: 8, top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider.items[index]["Quantity"] > 0?"":"Out of stock",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                                      ],
                                    ),
                                  ),
                                ),
                                
                                /* Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  MaterialButton(onPressed: () {
                                  
                                },
                                color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                                textColor: Colors.white,
                                child: const Text("Add to cart",style: TextStyle(fontFamily: "Lato",fontSize: 17),),
                                ),
                                //const SizedBox(width: 10,),
                                IconButton(onPressed: (() {
                                  setState(() {
                                    recommendationliked[index] = !recommendationliked[index];
                                  });
                                })
                                , icon:Icon(recommendationliked[index] == false? Icons.favorite_border_outlined:Icons.favorite,color: const Color.fromRGBO(198, 48, 48, 1),size: 30,) )
                                ],) */
                              ],
                            ),
                          ),
                        ); */