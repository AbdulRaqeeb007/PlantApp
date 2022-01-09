// ignore_for_file: avoid_print, use_key_in_widget_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/signin/signscreen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screen/home/HomeScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<FirebaseApp> _init = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _init,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print("Something went wrong");
        }

        if (snapshot.hasData) {
          print("Document does  exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          print("connected");
          return ap(context);
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          print("loading");
        }
        return Text("loading");
      },
    );
  }
}

GetMaterialApp ap(BuildContext context) {
  return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Plant App",
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: SignIn());
}
