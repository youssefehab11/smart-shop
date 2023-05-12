import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduationproject/address.dart';
import 'package:graduationproject/profile.dart';
import 'package:graduationproject/transition_animation.dart';
import 'package:lottie/lottie.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  void loading() {
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
    Future.delayed(
      const Duration(milliseconds: 3500),
      () {
        Navigator.pop(context);
        Navigator.of(context)
            .push(SlideLeftAnimationRoute(Page: const Profile()));
      },
    );
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    loading();
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    Navigator.of(context).push(SlideLeftAnimationRoute(Page: Address()));
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {},
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
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacementNamed('Login');
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

