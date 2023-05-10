import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/search.dart';
import 'package:graduationproject/shopping_list.dart';
import 'package:graduationproject/transition_animation.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  var recommendationliked = [];
  var topSellingLiked = [];
  List offerImages = ["assets/images/Cakes.jpg", "assets/images/Chocolates.jpg"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        automaticallyImplyLeading: false,
        //elevation: 0.0,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                    child: Container(
                      height: 50,
                      margin: const EdgeInsets.only(top: 15, left: 7, right: 3.5),
                                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                         ),
                      child: InkWell(
                        onTap: () {
                          showSearch(context: context, delegate: SearchItems());
                        },
                        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                          children: const[
                             Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                             SizedBox(
                              width: 5,
                            ),
                             Text(
                              "Find Product",
                              style: TextStyle(color: Colors.black),
                            )
                          ],
                          ),
                        ),
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 15, left: 3.5, right: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 50,
                  width: 50,
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(ScaleAnimationRoute(Page: ShoppingList()));
                      },
                      child: const Icon(
                        Icons.list_alt_rounded,
                        color: Colors.black87,
                        size: 25,
                      )),
                ),
              ],
            )
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          CarouselSlider(
              items: [Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 6.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image:  const DecorationImage(
                          image: AssetImage("assets/images/Cakes.jpg"),
                          fit: BoxFit.cover)),
                ),
              ],
              options: CarouselOptions(
                  height: 180.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration:
                      const Duration(milliseconds: 800))),
          Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              height: 35,
              color: Theme.of(context).colorScheme.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Offers", style: Theme.of(context).textTheme.headline2),
                ],
              )),
          Container(
              margin: const EdgeInsets.only(left: 10, top: 1),
              height: 140,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 250,
                            height: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(offerImages[index]),
                                    fit: BoxFit.cover)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  })),
          Container(
              margin: const EdgeInsets.only(
                top: 35,
              ),
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              height: 40,
              color: Theme.of(context).colorScheme.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Recommended For You",
                      style: Theme.of(context).textTheme.headline2),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            color: Color.fromRGBO(198, 48, 48, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  )
                ],
              )),
          Container(
              margin: const EdgeInsets.only(left: 15, top: 1, right: 15),
              height: 300,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  for(int i = 0;i<5;i++){
                    recommendationliked.add(false);
                  }
                  return Row(children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 200,
                            height: 280,
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
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Chocolates.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Description",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 5,bottom: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "EGP 0000",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  MaterialButton(onPressed: () {
                                  
                                },
                                color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                                textColor: Colors.white,
                                child: const Text("Add to cart",style: TextStyle(fontFamily: "Lato",fontSize: 17),),
                                ),
                                const SizedBox(width: 10,),
                                IconButton(onPressed: (() {
                                  setState(() {
                                    recommendationliked[index] = !recommendationliked[index];
                                  });
                                })
                                , icon:Icon(recommendationliked[index] == false? Icons.favorite_border_outlined:Icons.favorite,color: const Color.fromRGBO(198, 48, 48, 1),size: 30,) )
                                ],)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      width: 18,
                    )
                  ]);
                },
              )),
          Container(
              padding: const EdgeInsets.only(left: 10),
              width: double.infinity,
              height: 40,
              color: Theme.of(context).colorScheme.secondary,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Top Selling",
                      style: Theme.of(context).textTheme.headline2),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "See All",
                          style:TextStyle(
                            color: Color.fromRGBO(198, 48, 48, 1),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  )
                ],
              )),
          Container(
              margin: const EdgeInsets.only(left: 15, top: 1, right: 15),
              height: 300,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  for(int i = 0; i < 5; i++){
                    topSellingLiked.add(false);
                  }
                  return Row(children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 200,
                            height: 280,
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
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/Chocolates.jpg'),
                                          fit: BoxFit.cover)),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 15),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Description",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, top: 5),
                                  child: Row(
                                    children: [
                                      Text(
                                        "EGP 0000",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      )
                                    ],
                                  ),
                                ),
                                 Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  MaterialButton(onPressed: () {
                                  
                                },
                                color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                                textColor: Colors.white,
                                child: const Text("Add to cart",style: TextStyle(fontFamily: "Lato",fontSize: 17),),
                                ),
                                const SizedBox(width: 10,),
                                IconButton(onPressed: (() {
                                  setState(() {
                                    topSellingLiked[index] = !topSellingLiked[index];
                                  });
                                })
                                , icon:Icon(topSellingLiked[index] == false? Icons.favorite_border_outlined:Icons.favorite,color: const Color.fromRGBO(198, 48, 48, 1),size: 30,) )
                                ],)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 18,
                    )
                  ]);
                },
              )),
        ],
      ),
    );
  }
}
