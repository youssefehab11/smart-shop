import 'package:flutter/material.dart';
import 'package:graduationproject/theme_manager';
import 'package:graduationproject/themes.dart';

ThemeManager _themeManager = ThemeManager();

class CategoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryScreenState();
  }
}

class CategoryScreenState extends State<CategoryScreen> {
  List<Widget> tabBarScreens = [
    //Oil & Masalas
    Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
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
                          onTap: () {
                            //Go to Masalas items
                          },
                          child: Image.asset('assets/images/Masalas.jpg',fit: BoxFit.cover,)),
                      )
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Masalas"),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Spices items
                          },
                          child: Image.asset('assets/images/Spices.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Spices"),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Oil & Ghee items
                          },
                          child: Image.asset('assets/images/Oil&Ghee.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Column(
                  children: const [
                    Center(child: Text("Edibe Oil")),
                    Center(child: Text("& Ghee"))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),

    //Eggs, Meat & Fish
    Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Meat items
                          },
                          child: Image.asset('assets/images/Meat.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Mutton"),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Fish items
                          },
                          child: Image.asset('assets/images/Fish.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Fish"),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Eggs items
                          },
                          child: Image.asset('assets/images/Eggs.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Eggs"),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to chiken items
                          },
                          child: Image.asset('assets/images/Chicken.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Chicken"),
              ),
            ],
          ),
        ],
      ),
    ),

    // Beverages
    Container(
      margin: const EdgeInsets.only(top: 10),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Health drinks items
                          },
                          child: Image.asset('assets/images/Healthy drinks.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Health Drinks"),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Soft drinks items
                          },
                          child: Image.asset('assets/images/Soft drinks.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Soft Drinks"),
              ),
            ],
          ),
        ],
      ) ,
    ),

    //Fruits & Veggies
    Container(
      margin: const EdgeInsets.only(top: 10),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Fresh fruits items
                          },
                          child: Image.asset('assets/images/Fruits.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Center(child: Text("Fresh Fruits"),)
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Fresh vegetables items
                          },
                          child: Image.asset('assets/images/Vegetables.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Column(
                  children: const [
                    Text("Fresh"),
                    Text("vegetables"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ) ,
    ),
  
    //Bakery
    Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Cakes items
                          },
                          child: Image.asset('assets/images/Cakes.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Cakes"),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Biscuits items
                          },
                          child: Image.asset('assets/images/Biscuits.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Biscuits"),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Bread & buns items
                          },
                          child: Image.asset('assets/images/Bread.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Column(
                  children: const [
                    Center(child: Text("Bread")),
                    Center(child: Text("& buns"))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
  
    //Snacks
     Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Cookies items
                          },
                          child: Image.asset('assets/images/Cookies.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Cookies"),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Chocolates items
                          },
                          child: Image.asset('assets/images/Chocolates.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Chocolate"),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Noodles items
                          },
                          child: Image.asset('assets/images/Noodles.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Noodles"),
                ),
            ],
          ),
        ],
      ),
    ),

    //Food Grains
    Container(
      margin: const EdgeInsets.only(top: 10),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Flour items
                          },
                          child: Image.asset('assets/images/Flour.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Atta & Flour"),
              ),
            ],
          ),
          Column(
            children: [
              Center(
                child: Container(
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            //Go to Rice items
                          },
                          child: Image.asset('assets/images/Rice.jpg',fit: BoxFit.cover,)),
                      ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Center(
                child: Text("Rice"),
              ),
            ],
          ),
        ],
      ) ,
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Categories",
            style: TextStyle(color: Colors.white, fontSize: 25,fontFamily: "Poppins",fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          //elevation: 0.0,
        ),
        body: DefaultTabController(
          initialIndex: 0,
          animationDuration: const Duration(microseconds: 1),
          length: 7,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                height: double.infinity,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: TabBar(
                    indicatorColor: const Color.fromRGBO(198, 48, 48, 1),
                    tabs: [
                    RotatedBox(
                        quarterTurns: 3,
                        child: Column(
                          children: [
                            SizedBox(child:Row(mainAxisAlignment: MainAxisAlignment.center)),
                            const Text("Oil &",style: TextStyle(fontFamily: "Poppins",fontSize: 16)), const Text("Masalas",style: TextStyle(fontFamily: "Poppins",fontSize: 16))
                          ],
                        )),
                    RotatedBox(
                        quarterTurns: 3,
                        child: Column(
                          children: [
                            SizedBox(child:Row(mainAxisAlignment: MainAxisAlignment.center)),
                            const Text("Eggs, Meat,",style: TextStyle(fontFamily: "Poppins",fontSize: 16)), const Text("& Fish",style: TextStyle(fontFamily: "Poppins",fontSize: 16))],
                        )),
                    RotatedBox(quarterTurns: 3, child: Row(mainAxisAlignment: MainAxisAlignment.center,children:const [Text("Beverages",style: TextStyle(fontFamily: "Poppins",fontSize: 16))],)),
                    RotatedBox(
                        quarterTurns: 3,
                        child: Column(
                          children:[SizedBox(child:Row(mainAxisAlignment: MainAxisAlignment.center)),const Text("Fruits &",style: TextStyle(fontFamily: "Poppins",fontSize: 16)), const Text("Veggies",style: TextStyle(fontFamily: "Poppins",fontSize: 16))],
                        )),
                        RotatedBox(quarterTurns: 3, child: Row(mainAxisAlignment: MainAxisAlignment.center,children:const [Text("Bakery",style: TextStyle(fontFamily: "Poppins",fontSize: 16))],)),
                        RotatedBox(quarterTurns: 3, child: Row(mainAxisAlignment: MainAxisAlignment.center,children:const [Text("Snacks",style: TextStyle(fontFamily: "Poppins",fontSize: 16))],)),
                        RotatedBox(quarterTurns: 3, child: Row(mainAxisAlignment: MainAxisAlignment.center,children:const [Text("Food Grains",style: TextStyle(fontFamily: "Poppins",fontSize: 16),)],)),
                  ]),
                ),
              ),
              Container(
                width: 2,
                height: double.infinity,
                color: Theme.of(context).colorScheme.primary,
              ),
              Expanded(
                child: SizedBox(
                    height: double.infinity,
                    child: TabBarView(children: [
                      tabBarScreens.elementAt(0),
                      tabBarScreens.elementAt(1),
                      tabBarScreens.elementAt(2),
                      tabBarScreens.elementAt(3),
                      tabBarScreens.elementAt(4),
                      tabBarScreens.elementAt(5),
                      tabBarScreens.elementAt(6),
                    ])),
              )
            ],
          ),
        ));
  }
}
