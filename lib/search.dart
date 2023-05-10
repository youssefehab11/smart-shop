import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/account.dart';
import 'package:graduationproject/provider_controller.dart';
import 'package:graduationproject/subcategory_items.dart';
import 'package:graduationproject/transition_animation.dart';
import 'package:lottie/lottie.dart';

import 'category_screen.dart';
import 'item_details.dart';

class SearchItems extends SearchDelegate{
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(onPressed: () {
      query = "";
    }, icon: const Icon(Icons.close_rounded))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: const Icon(Icons.arrow_back_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text("data");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final provider = ProviderController.of(context);
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
            nextScreen: CategoryScreen());
      },
    );
    Future.delayed(
      const Duration(milliseconds: 3000),
      () {
        Navigator.pop(context);
        Navigator.of(context)
            .pushReplacement(SlideLeftAnimationRoute(Page: SubCategoryItems()));
      },
    );
  }

    if(query.isNotEmpty){
      return  StreamBuilder(
      stream: FirebaseFirestore.instance.collection("ProductsList").snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(color: Color.fromRGBO(198, 48, 48, 1),),);
        }
        else{
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var data = snapshot.data!.docs[index].data();
              if(data["SubCategory"].toString().contains(query)||data["SubCategory"].toString().toLowerCase().contains(query)){
                return Column(
                  children: [
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          provider.items.clear();
                          provider.subCategoryTitle = data["SubCategory"];
                          provider.getSubCategoryId(data["SubCategory"]);
                          loadingItem(); 
                          Future.delayed(const Duration(seconds: 3),() {
                            provider.usedItems = provider.items;
                          },);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0,right: 8),
                          child: Row(
                            children: [
                              Text("${data["SubCategory"]}",style: const TextStyle(fontSize: 18),),
                              const Spacer(),
                              const Icon(Icons.arrow_forward_ios_rounded,size: 18,color: Colors.grey,)
                            ],
                          ),
                        )),
                    ),
                    Container(height: 0.8,color: Theme.of(context).colorScheme.onBackground,)
                  ],
                );
              }else{
                return Container();
              }
          },);
        }
      },);
    }
    else{
      return Container();
    }
  }

}