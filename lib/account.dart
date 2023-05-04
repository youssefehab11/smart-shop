import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/provider_controller.dart';
import 'package:graduationproject/transition_animation.dart';
import 'package:lottie/lottie.dart';


class Account extends StatefulWidget {
  const Account({super.key});


  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
   void loading(){
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
            nextScreen: const Profile());
      },
    );
      Future.delayed(const Duration(milliseconds:3500 ),() {
        Navigator.pop(context);
         Navigator.of(context).push(
                                    SlideLeftAnimationRoute(
                                       Page: const Profile()));
         
        },); 
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "Account",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.person_outline_rounded, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Profile",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        const Icon(Icons.keyboard_arrow_right,size:30,),
                      ],
                    ),
                  ),
                  onTap: () {
                    loading();
                   // Navigator.of(context)
                       // .push(SlideLeftAnimationRoute(Page: const Profile()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Theme.of(context).colorScheme.secondaryContainer,
                height: 0.5,
                child: const Divider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.mail_outline_rounded, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Inbox",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        const Icon(Icons.keyboard_arrow_right,size:30,),
                      ],
                    ),
                  ),
                  onTap: () {
                    //loading();
                   // Navigator.of(context)
                       // .push(SlideLeftAnimationRoute(Page: const Profile()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Theme.of(context).colorScheme.secondaryContainer,
                height: 0.5,
                child: const Divider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.favorite_border_rounded, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Saved Items",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        const Icon(Icons.keyboard_arrow_right,size:30,),
                      ],
                    ),
                  ),
                  onTap: () {
                    //loading();
                   // Navigator.of(context)
                       // .push(SlideLeftAnimationRoute(Page: const Profile()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Theme.of(context).colorScheme.secondaryContainer,
                height: 0.5,
                child: const Divider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.location_on_outlined, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Address",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        const Icon(Icons.keyboard_arrow_right,size:30,),
                      ],
                    ),
                  ),
                  onTap: () {
                    //loading();
                   // Navigator.of(context)
                       // .push(SlideLeftAnimationRoute(Page: const Profile()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Theme.of(context).colorScheme.secondaryContainer,
                height: 0.5,
                child: const Divider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.list_alt_rounded, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Orders",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        const Icon(Icons.keyboard_arrow_right,size:30,),
                      ],
                    ),
                  ),
                  onTap: () {
                    //loading();
                   // Navigator.of(context)
                       // .push(SlideLeftAnimationRoute(Page: const Profile()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Theme.of(context).colorScheme.secondaryContainer,
                height: 0.5,
                child: const Divider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.card_giftcard_rounded, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Vouchers",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        const Icon(Icons.keyboard_arrow_right,size:30,),
                      ],
                    ),
                  ),
                  onTap: () {
                    //loading();
                   // Navigator.of(context)
                       // .push(SlideLeftAnimationRoute(Page: const Profile()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Theme.of(context).colorScheme.secondaryContainer,
                height: 0.5,
                child: const Divider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.person_search_outlined, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Search History",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        const Icon(Icons.keyboard_arrow_right,size:30,),
                      ],
                    ),
                  ),
                  onTap: () {
                    //loading();
                   // Navigator.of(context)
                       // .push(SlideLeftAnimationRoute(Page: const Profile()));
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: Theme.of(context).colorScheme.secondaryContainer,
                height: 0.5,
                child: const Divider(),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.logout_rounded, size: 30),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text("Logout",
                              style: Theme.of(context).textTheme.headline6),
                        ),
                        const Icon(Icons.keyboard_arrow_right,size:30,),
                      ],
                    ),
                  ),
                  onTap: () async{
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed('Login');
                    //loading();
                   // Navigator.of(context)
                       // .push(SlideLeftAnimationRoute(Page: const Profile()));
                  },
                ),
              ),
              /* Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: InkWell(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.logout, size: 30),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text("Logout",
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      IconButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacementNamed('Login');
                        },
                        icon : const Icon (Icons.keyboard_arrow_right,size:30),
                      ),
                    ],
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed('Login');
                  },
                ),
              ), */
            ],
          ),
        ));
  }
}
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: const Text(
            "Profile",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: screenHeight * 0.25,
              color: const Color.fromRGBO(198, 48, 48, 1),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  radius: 60,
                  child: const Icon(
                    Icons.person,
                    size: 110,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Scroll(),
          ],
        ));
  }
}

Widget Scroll() {
  var user = FirebaseAuth.instance.currentUser;
  DocumentReference userref = FirebaseFirestore.instance.collection("users").doc(user!.uid);

  return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 1.0,
      minChildSize: 0.75,
      builder: (context, scrollController) {
        return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    height: 5,
                                    width: 35,
                                    color: Colors.black12),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                left: 25,
                              ),
                              child: Text("First Name",
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true, //<-- SEE HERE
                                        fillColor: Theme.of(context).colorScheme.onPrimary,
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        disabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        errorBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25.0, top: 15),
                                  child: StreamBuilder(
                                      stream: userref.snapshots(),
                                      builder: (context,snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(snapshot.data!['First Name'],
                                                    style: const TextStyle(
                                                        fontSize: 20));
                                              
                                        } else {
                                          return const Text("");
                                        }
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 25,
                              ),
                              child: Text("Last Name",
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                            Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: TextField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        filled: true, //<-- SEE HERE
                                        fillColor: Theme.of(context).colorScheme.onPrimary,
                                        enabledBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedBorder: const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        disabledBorder:const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        errorBorder:const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                        focusedErrorBorder:
                                            const UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                        ),
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 25, top: 15),
                                  child: StreamBuilder(
                                      stream: userref.snapshots(),
                                      builder: (context,snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(snapshot.data!['Last Name'],
                                                    style: const TextStyle(
                                                        fontSize: 20));
                                        } else {
                                          return const Text("");
                                        }
                                      }),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 25,
                              ),
                              child: Text("Phone Number",
                                  style: Theme.of(context).textTheme.headline6),
                            ),
                          ]),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE

                                fillColor:
                                   Theme.of(context).colorScheme.onPrimary,

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                disabledBorder:const  UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25, top: 15.0),
                          child: StreamBuilder(
                              stream:userref.snapshots(),
                              builder: (context,snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!['Phone Number'],
                                            style: const TextStyle(fontSize: 20));
                                } else {
                                  return const Text("");
                                }
                              }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 25,
                      ),
                      child: Text("Email Address",
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                              readOnly: true,
                              decoration: InputDecoration(
                                filled: true, //<-- SEE HERE

                                fillColor:
                                    Theme.of(context).colorScheme.onPrimary,

                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                disabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                errorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),

                                focusedErrorBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0, top: 15),
                          child: StreamBuilder(
                              stream: userref.snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Text(snapshot.data!['Email address'],
                                            style: const TextStyle(fontSize: 20));
                                      
                                } else {
                                  return const Text("");
                                }
                              }),
                        ),
                      ],
                    ),
                     Row(  
                      mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        
                         Padding(
                           padding: const EdgeInsets.only(top : 25.0),
                           child: MaterialButton(onPressed: () {
                                        
                                      },
                                      color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
                                      textColor: Colors.white,
                                      child: const Text("Edit Profile",style: TextStyle(fontFamily: "Lato",fontSize: 17),),
                                      ),
                         ),
                       ],
                     ),
                  ]),
            ));
      });
}

