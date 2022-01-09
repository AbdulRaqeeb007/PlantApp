import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/signin/signscreen.dart';

import 'sellscreen.dart';

class Drawerrr extends StatelessWidget {
  const Drawerrr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ProfileInfo(
        Email: 'abdulraqeeb133@gmail.com',
        Name: "Abdul Raqeeb",
        image: 'assets/images/image_1.png',
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.Name,
    required this.Email,
    required this.image,
  }) : super(key: key);

  final String Name;
  final String Email;
  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: size.height / 7),
          height: 250,
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: kBackgroundColor,
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage(image)),
                      borderRadius: BorderRadius.circular(500)),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(text: "$Name\n", style: TextStyle(fontSize: 30)),
                      TextSpan(text: "$Email", style: TextStyle(fontSize: 20))
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50, right: 150),
          child: ElevatedButton(
            style: OutlinedButton.styleFrom(
                shape: StadiumBorder(), backgroundColor: kPrimaryColor),
            child: Text(
              "Sell",
              style: TextStyle(fontSize: 30),
            ),
            onPressed: () {
              Get.to(Sell());
            },
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
              margin: EdgeInsets.only(top: 50),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(SignIn());
                },
                style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(), backgroundColor: kPrimaryColor),
                child: Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 30),
                ),
              )),
        )
      ],
    );
  }
}
