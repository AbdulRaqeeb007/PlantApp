// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, override_on_non_overriding_member, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/home/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/screen/signin/cloud.dart';
import 'package:plant_app/screen/signin/signup.dart';

class SignIn extends StatelessWidget {
  @override
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController email_cont = TextEditingController();
  TextEditingController password_cont = TextEditingController();

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

    signin() async {
      final String email = email_cont.text;
      final String password = password_cont.text;

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null && user.emailVerified) {
          print("user${user}");
          print("user.emailVerified${user.emailVerified}");
          Get.to(HomeScreen());
        }

        if (user != null && !user.emailVerified) {
          await user.sendEmailVerification();

          DialogBox("varify", "please verify email", Icons.verified);
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
          DialogBox("email", "Email Not Found", Icons.email);
          email_cont.clear();
          password_cont.clear();
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
          DialogBox("password", "Wrong password provided for that user",
              Icons.password);
          password_cont.clear();
        }
      }

      //  Futur <UserCredential> user = auth.createUserWithEmailAndPassword(
      // email: "adc", password: "qwerty");
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
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
                              fontSize: 50,
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
            SizedBox(
              child: Container(
                  margin: EdgeInsets.only(
                      top: 50, left: kDefaultPadding, right: kDefaultPadding),
                  child: Column(
                    children: [
                      TextField(
                        hinttext: 'Enter Email',
                        controll: email_cont,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextField(
                        hinttext: "Enter Password",
                        controll: password_cont,
                      ),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              blurRadius: 2,
                              color: kBackgroundColor.withOpacity(.32))
                        ]),
                        margin: EdgeInsets.only(top: 40),
                        child: ElevatedButton(
                          style: OutlinedButton.styleFrom(
                              backgroundColor: kBackgroundColor),
                          onPressed: () {
                            Get.to(HomeScreen());
                          },
                          child: Container(
                              padding: EdgeInsets.all(5),
                              height: 40,
                              width: 80,
                              color: kPrimaryColor,
                              child: Text(
                                "Sign In",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Row(
                          children: [
                            Text(
                              "Dont Have Account?",
                              style: TextStyle(
                                  fontSize: 20, color: kBackgroundColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(SignUp());
                              },
                              child: Text("SignUP",
                                  style: TextStyle(
                                      fontSize: 30, color: kBackgroundColor)),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    ));
  }
}

class TextField extends StatelessWidget {
  TextField({required this.hinttext, required this.controll});
  final String hinttext;
  final controll;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kBackgroundColor, borderRadius: BorderRadius.circular(50)),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: TextFormField(
        controller: controll,
        style: TextStyle(fontSize: 25),
        decoration: InputDecoration(
          hintText: "$hinttext",
          hintStyle: TextStyle(color: kPrimaryColor.withOpacity(.5)),
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
