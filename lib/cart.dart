import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/checkout.dart';
import 'package:graduationproject/provider_controller.dart';
import 'package:graduationproject/transition_animation.dart';

class Cart extends StatefulWidget{
   const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}
  var user = FirebaseAuth.instance.currentUser;
  DocumentReference userref = FirebaseFirestore.instance.collection("users").doc(user!.uid);
class _CartState extends State<Cart> {

  Widget setPrice(int index){
    final provider = ProviderController.of(context);
    double value = double.parse((provider.cartItems[index]["Price"]).toStringAsFixed(2));
    return Padding(
      padding: const EdgeInsets.only(left:20),
      child: Text("$value EGP",
      style: Theme.of(context).textTheme.headline2,),
    );
  }

  Widget getSubTotal(){
    final provider = ProviderController.of(context);
    double subtotal = 0;
    provider.cartItems.forEach((element) {
      subtotal += element["Price"];
    });
    subtotal = double.parse((subtotal).toStringAsFixed(2));
    provider.subtotal = double.parse((subtotal).toStringAsFixed(2));
    return Text("$subtotal EGP",style: Theme.of(context).textTheme.headline2,);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ProviderController.of(context);
    return Scaffold(
      appBar:AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Cart",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
          body: StreamBuilder(
            initialData: provider.connectivtyResult,
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              if(snapshot.data == ConnectivityResult.wifi || snapshot.data == ConnectivityResult.mobile){
                return provider.cartItems.isEmpty? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  width: double.infinity,
                  height: 300,
                  child: const Image(image: AssetImage('assets/images/Empty Cart.jpg'),)) ,
                const Text("Your cart is empty!",style: TextStyle(fontSize: 16),),
              ],
            ),
          )
          : ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            width: double.infinity,
            height: 30,
            color: Theme.of(context).colorScheme.onBackground,
            child: const Text(
              "CART SUMMARY",
              style: TextStyle(
               fontSize: 15,
               fontWeight: FontWeight.bold,
               fontFamily: "Lato",),
            )
          ), 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 70,
              child: Row(
                children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text("Subtotal",style: Theme.of(context).textTheme.headline4,),
                        const SizedBox(width: 8,),
                        getSubTotal(),
                      ],
                    ),
                  ],
                ),  
              ],),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width-80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color:const Color.fromRGBO(198, 48, 48, 1)),
                    child: Material(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      color: Colors.transparent,
                      child: InkWell(onTap:() {
                        userref.update({"Custom Country":""});
                        userref.update({"Custom City":""});
                        userref.update({"Custom Subcity":""});
                        userref.update({"Custom Street":""});
                        userref.update({"Custom Thoroughfare":""});
                        provider.customAddressFlag = false;
                        provider.cardNumber = "";
                        provider.expiryDate ="";
                        provider.cardHolderName ="";
                        provider.cvvCode ="";
                        provider.checkConnectivity();
                        Navigator.of(context).push(SlideLeftAnimationRoute(Page: Checkout()));
                      },
                       customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          const Icon(Icons.shopping_cart_checkout_outlined,color: Colors.white,),
                          const SizedBox(width: 8,),
                          const Text("Proceed to buy ",
                          style: TextStyle(fontFamily: "Poppins",fontSize: 17,color: Colors.white),),
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text("(Items: ${provider.cartItems.length})",
                            style: const TextStyle(fontFamily: "Poppins",fontSize: 14,color: Colors.white),),
                          )
                        ],)
                          ),
                    ),
                 ),
              ],
            ),
          ),
              Container(
            padding: const EdgeInsets.only(left: 10, top: 5),
            width: double.infinity,
            height: 30,
            color: Theme.of(context).colorScheme.onBackground,
            child: Row(children: [
               const Text(
              "CART",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Lato",),
            ),
            const SizedBox(width: 5,),
            Text("(${provider.cartItems.length})")
            ],)
          ),
              ListView.builder( 
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                    itemCount: provider.cartItems.length,
                    itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey(provider.cartItems[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: ((direction) {
                        setState(() {
                          provider.cartItems.removeAt(index);
                        });
                      }),
                      background: Container(
                        height: 72,
                        color: const Color.fromRGBO(198, 48, 48, 1),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              trailing: Icon(
                              Icons.delete_rounded,
                              size: 30,
                              color: Colors.white,
                              ),
                       ),
                          ],
                        )),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10,left: 10),
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/${provider.cartItems[index]["Image"]}'),
                                      fit: BoxFit.cover)),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20,top: 5),
                                    child: Text(provider.cartItems[index]["Item Name"],
                                    style: Theme.of(context).textTheme.headline2,),
                                  ),
                                  setPrice(index),
                                  Row(children: [
                                    Container(
                                    margin: const EdgeInsets.all(6),
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    color: provider.cartItems[index]["Selected Quantity"] == 1 ? Colors.grey:const Color.fromRGBO(198, 48, 48, 1),),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: provider.cartItems[index]["Selected Quantity"] == 1 ? null : () {
                                          setState(() {
                                            provider.cartItems[index]["Selected Quantity"]--;
                                            provider.cartItems[index]["Price"] = provider.cartItems[index]["Default Price"] 
                                            * provider.cartItems[index]["Selected Quantity"];
                                          });
                                        },
                                        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                      child:  const Center(child: Icon(Icons.remove,color: Colors.white,size: 18,))),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(color: Colors.grey)),
                                    child: Center(child: Text("Qty: ${provider.cartItems[index]["Selected Quantity"].toString()}",style:Theme.of(context).textTheme.bodyText1))),
                                  Container(
                                    margin: const EdgeInsets.all(6),
                                    width: 28,
                                    height: 28,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                    color: provider.cartItems[index]["Selected Quantity"] == provider.cartItems[index]["Total Quantity"]  ? Colors.grey:const Color.fromRGBO(198, 48, 48, 1),),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: provider.cartItems[index]["Selected Quantity"] == provider.cartItems[index]["Total Quantity"] ? null : () {
                                          setState(() {
                                            provider.cartItems[index]["Selected Quantity"]++;
                                            provider.cartItems[index]["Price"] = provider.cartItems[index]["Default Price"] 
                                            * provider.cartItems[index]["Selected Quantity"];
                                          });
                                          
                                        },
                                        customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                                      child:  const Center(child: Icon(Icons.add,color: Colors.white,size: 18,))),
                                    ),
                                  ),
                                  ],)
                                ],)
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8,left: 8,right: 8),
                            child: Container(
                              width: double.infinity,
                              height: 0.5,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  },),
            ],
          );
              }
              else{
                return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image(image: AssetImage("assets/images/No Connection.jpg")),
                ),
                SizedBox(height: 10,),
                Text("Whoops!",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text("No internet connection found! check your connection please.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),)
              ],
            );
              }
            },
          )
    );
  }
}