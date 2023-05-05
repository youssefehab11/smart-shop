
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/provider_controller.dart';

class Cart extends StatefulWidget{
  @override
  State<Cart> createState() => _CartState();
}
  var user = FirebaseAuth.instance.currentUser;
  DocumentReference userref = FirebaseFirestore.instance.collection("users").doc(user!.uid);
class _CartState extends State<Cart> {

  Widget setPrice(int index){
    final provider = ProviderController.of(context);
    double value = double.parse((provider.cartItems[index]["Price"]*provider.cartItems[index]["Selected Quantity"]).toStringAsFixed(2));
    return Padding(
      padding: const EdgeInsets.only(left:20),
      child: Text("$value EGP",
      style: Theme.of(context).textTheme.headline4,),
    );
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
          body: provider.cartItems.isEmpty? const Center(
            child: Text("No Items yet"),
          )
          : ListView.builder(
            physics: const BouncingScrollPhysics(),
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
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
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 0.5,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },)
    );
  }
}