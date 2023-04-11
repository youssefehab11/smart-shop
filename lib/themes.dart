import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xfff2f9fe),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(25),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(25),
          ),
          labelStyle: const TextStyle(
            color:Colors.black
          ),
          hintStyle: const TextStyle(
            color: Colors.grey
          ),
          prefixIconColor: Colors.black,
          suffixIconColor: Colors.black, 
          errorStyle: const TextStyle(color: Colors.red),
        ),
        hintColor: Colors.black,
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black87),
        colorScheme: const ColorScheme(brightness: Brightness.light, primary: Colors.black87, onPrimary: Colors.white, secondary: Colors.white, onSecondary: Color.fromRGBO(55, 55, 55, 1), error: Color.fromRGBO(117, 117, 117, 1), onError: Color.fromRGBO(117, 117, 117, 1), background: Color.fromRGBO(117, 117, 117, 1), onBackground: Color.fromRGBO(224, 224, 224, 1), surface: Color.fromRGBO(117, 117, 117, 1), onSurface: Color.fromRGBO(117, 117, 117, 1),primaryContainer: Colors.black),
        indicatorColor: Colors.deepPurple,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(198, 48, 48, 1),hoverColor: Colors.white),
        iconTheme: const IconThemeData(color: Colors.black),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) {
            if(states.contains(MaterialState.selected)){
              return const Color.fromRGBO(198, 48, 48, 1);
            }
              return Colors.white;
          },),
          trackColor: MaterialStateColor.resolveWith((states) {
            if(states.contains(MaterialState.selected)){
              return const Color.fromRGBO(234, 87, 87, 1);
            }
              return const Color.fromRGBO(176, 176, 176, 1);
          },),
        ),
        textTheme: const TextTheme(
        headline1: TextStyle(
          color: Colors.black,
          fontSize: 60,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins"
        ),
        headline2: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ),
        headline3:TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        headline4:TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          fontFamily: "Poppins",
          color: Colors.black),
        headline5:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 34,
          fontFamily: "Poppins",
          color: Colors.black),
        
    bodyText1: TextStyle(
      color: Colors.black87,
      fontFamily: "Lato",
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    bodyText2: TextStyle(
      color: Colors.black54,
      fontSize: 15,
    ),
  ),
  backgroundColor: Colors.black,
  shadowColor: const Color.fromARGB(255, 227, 227, 227),
  checkboxTheme: CheckboxThemeData(
    checkColor:MaterialStateColor.resolveWith((states) =>Colors.white,),
    fillColor: MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return const Color.fromRGBO(198, 48, 48, 1);
      }
      return const Color.fromRGBO(66, 66, 66, 1);
    },)
  ),
  tabBarTheme: TabBarTheme(
    labelColor:const Color.fromRGBO(198, 48, 48, 1),
    unselectedLabelColor: Colors.black,
    overlayColor:MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return const Color.fromRGBO(198, 48, 48, 1);
      }
      return const Color.fromRGBO(224, 224, 224, 1);
    },),
  ),
);

ThemeData darkTheme = ThemeData(

    inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0x00000000),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(25),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(25),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white54),
            borderRadius: BorderRadius.circular(25),
          ),
          labelStyle: const TextStyle(
            color:Colors.white54
          ),
          hintStyle: const TextStyle(
            color: Colors.grey
          ),
          prefixIconColor: Colors.white54,
          suffixIconColor: Colors.white54, 
          errorStyle: const TextStyle(color: Colors.red)
        ),
        hintColor: Colors.black,
        brightness: Brightness.dark,
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateColor.resolveWith((states) {
            if(states.contains(MaterialState.selected)){
              return const Color.fromRGBO(198, 48, 48, 1);
            }
              return Colors.white;
          },),
          trackColor: MaterialStateColor.resolveWith((states) {
            if(states.contains(MaterialState.selected)){
              return const Color.fromRGBO(234, 87, 87, 1);
            }
              return const Color.fromRGBO(176, 176, 176, 1);
          },),
        ),
  appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(221, 37, 35, 35)),
  colorScheme: const ColorScheme(brightness: Brightness.dark, primary: Color.fromARGB(221, 37, 35, 35), onPrimary: Color.fromRGBO(66, 66, 66, 1), secondary: Color.fromARGB(5, 0, 0, 0), onSecondary: Colors.grey, error: Colors.grey, onError: Colors.grey, background: Colors.grey, onBackground: Color.fromRGBO(66, 66, 66, 1), surface: Colors.grey, onSurface: Colors.grey,primaryContainer: Colors.white54),
  indicatorColor: const Color.fromRGBO(198, 48, 48, 1),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color.fromRGBO(198, 48, 48, 1),hoverColor: Colors.white),
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: const TextTheme(
    headline1: TextStyle(
          color: Colors.white,
          fontSize: 60,
          fontWeight: FontWeight.bold,
          fontFamily: "Poppins"
        ),
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    headline3:TextStyle(
          color: Colors.white54,
          fontSize: 16,
        ),
        headline4:TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          fontFamily: "Poppins",
          color: Colors.white),
        headline5:TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 34,
          fontFamily: "Poppins",
          color: Colors.white),
    bodyText1: TextStyle(
      color: Colors.white,
      fontFamily: "Lato",
      fontWeight: FontWeight.w400,
      fontSize: 18,
    ),
    bodyText2: TextStyle(
      color: Colors.white54,
      fontSize: 15,
    ),
  ),
  backgroundColor: Colors.black,
  shadowColor: const Color.fromRGBO(33, 33, 33, 1),
  checkboxTheme: CheckboxThemeData(
    checkColor:MaterialStateColor.resolveWith((states) =>Colors.white,),
    fillColor: MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return const Color.fromRGBO(198, 48, 48, 1);
      }
      return Colors.white;
    },)
  ),
  tabBarTheme: TabBarTheme(
    labelColor:const Color.fromRGBO(198, 48, 48, 1),
    unselectedLabelColor: Colors.white,
    overlayColor:MaterialStateColor.resolveWith((states) {
      if(states.contains(MaterialState.selected)){
        return const Color.fromRGBO(198, 48, 48, 1);
      }
      return const Color.fromARGB(255, 41, 41, 41);
    },),
  )
);