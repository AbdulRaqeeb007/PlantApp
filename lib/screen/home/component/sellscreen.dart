// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, override_on_non_overriding_member, unused_import, avoid_print

import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/home/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/screen/signin/cloud.dart';
import 'package:plant_app/screen/signin/signscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:plant_app/screen/signin/textfiel_input.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Sell extends StatefulWidget {
  @override
  State<Sell> createState() => _SellState();
}

class _SellState extends State<Sell> {
  late String urls;
  @override
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController Title_cont = TextEditingController();

  TextEditingController Detail_cont = TextEditingController();

  TextEditingController Price_cont = TextEditingController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Widget build(BuildContext context) {
    DialogBox(final String title, final String message, final icon) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Container(
                  child: Row(
                    children: [
                      Icon(icon),
                      Spacer(),
                      Text(
                        title.toUpperCase(),
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                content: Text(message),
              ));
    }

    Future image_pick() async {
      firebase_storage.FirebaseStorage storage =
          firebase_storage.FirebaseStorage.instance;
      firebase_storage.Reference ref =
          firebase_storage.FirebaseStorage.instance.ref('/notes.txt');
      final ImagePicker pick = ImagePicker();
      final images = await pick.pickImage(source: ImageSource.gallery);

      // final List<XFile>? images = await pick.pickMultiImage();
      File file = File(images!.path);
      print(file);
      print(images.path);
      String basename = path.basename(images.path);

      try {
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref(basename);
        await ref.putFile(file);

        // if (await ref.putFile(file) =='TaskState.success') {
        //   DialogBox("Upload", "Image Are Uploding", Icons.upload);
        // }
        String url = await ref.getDownloadURL();

        print("upload successful");
        print(url);
        setState(() {
          urls = url;
        });
      } catch (e) {
        print(e);
        // e.g, e.code == 'canceled'
      }
//
    }

    Future<void> sell() async {
      final String Title = Title_cont.text;
      final String Detail = Detail_cont.text;
      final String Price = Price_cont.text;
      User? user = FirebaseAuth.instance.currentUser;
      final a = user;
      print(a?.uid);
      try {
        await firestore.collection("Post").doc().set({
          "email": user?.email,
          'title': Title,
          "description": Detail,
          "price": Price,
          "image": urls
        });
        print("Successfuly Uploaded");
        Get.to(HomeScreen());
      } catch (e) {
        print(e);
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: kPrimaryColor,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 100, left: kDefaultPadding, right: kDefaultPadding),
                color: kPrimaryColor,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: kPrimaryColor,
                          child: Text(
                            "Plant App",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.width / 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      child: Image.asset(
                        'assets/images/logo.png',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: 50, left: kDefaultPadding, right: kDefaultPadding),
                  child: Column(
                    children: [
                      TextFild(hinttext: "Enter Title", controll: Title_cont),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      Description(),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextFild(
                        hinttext: "Enter Price",
                        controll: Price_cont,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      GestureDetector(
                        onTap: image_pick,
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 70,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 10),
                                      blurRadius: 1,
                                      color: kPrimaryColor.withOpacity(0.21)),
                                ],
                                borderRadius: BorderRadius.circular(30)),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Add Photo ++",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: kBackgroundColor.withOpacity(.32))
                        ]),
                        margin: EdgeInsets.only(top: 40, bottom: 40),
                        child: ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: kBackgroundColor),
                          onPressed: sell,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              height: 40,
                              width: 80,
                              color: kPrimaryColor,
                              child: Text(
                                " Sell",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Container Description() {
    return Container(
      decoration: BoxDecoration(
          color: kBackgroundColor, borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: TextFormField(
        maxLines: 10,
        controller: Detail_cont,
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
          hintText: "Enter Description",
          hintStyle: TextStyle(color: kPrimaryColor.withOpacity(.5)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
