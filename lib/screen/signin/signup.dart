// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, override_on_non_overriding_member, unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/home/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:plant_app/screen/signin/cloud.dart';
import 'package:plant_app/screen/signin/signscreen.dart';
import 'textfiel_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

cloud_store(String user, email) {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firestore.collection("user").add({'Name': user, "Email": email});
}

class SignUp extends StatelessWidget {
  @override
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController user_name_cont = TextEditingController();

  TextEditingController email_cont = TextEditingController();
  TextEditingController password_cont = TextEditingController();
  TextEditingController conf_password_cont = TextEditingController();

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

    signup() async {
      final String email = email_cont.text;
      final String password = password_cont.text;
      final String conf_password = conf_password_cont.text;
      final String user_name = user_name_cont.text;
      if (conf_password == password) {
        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .createUserWithEmailAndPassword(
                  email: email, password: conf_password);
          User? user = FirebaseAuth.instance.currentUser;

          user != null;

          if (user != null && !user.emailVerified) {
            await user.sendEmailVerification();
            print("varify email${user.emailVerified}");
            Get.to(SignIn());
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            print('The password provided is too weak.');
            DialogBox("password", "The password provided is too weak",
                Icons.password);
          } else if (e.code == 'email-already-in-use') {
            print('The account already exists for that email');
            DialogBox("email", "The account already exists for that email",
                Icons.email);
            // email_cont.clear();
            // password_cont.clear();
            // conf_password_cont.clear();
          }
        } catch (e) {
          print(e);
        }
      } else {
        DialogBox("Password", "Confirm Password Not Match", Icons.password);
        // password_cont.clear();
        // conf_password_cont.clear();
      }
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
                      TextFild(
                          hinttext: "Enter UserName", controll: user_name_cont),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextFild(
                        hinttext: 'Enter Email',
                        controll: email_cont,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextFild(
                        hinttext: "Enter Password",
                        controll: password_cont,
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      TextFild(
                          hinttext: "Enter Confirm Password",
                          controll: conf_password_cont),
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
                          onPressed: signup,
                          child: Container(
                              padding: EdgeInsets.all(5),
                              height: 40,
                              width: 80,
                              color: kPrimaryColor,
                              child: Text(
                                "Sign Un",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35),
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Have Account?",
                                  style: TextStyle(
                                      fontSize: 20, color: kBackgroundColor),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(SignIn());
                                  },
                                  child: Text("SignIn",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: kBackgroundColor)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "SignUp With",
                                  style: TextStyle(
                                      fontSize: 20, color: kBackgroundColor),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Future<UserCredential>
                                        signInWithGoogle() async {
                                      // Trigger the authentication flow
                                      final GoogleSignInAccount? googleUser =
                                          await GoogleSignIn().signIn();

                                      // Obtain the auth details from the request
                                      final GoogleSignInAuthentication?
                                          googleAuth =
                                          await googleUser?.authentication;

                                      // Create a new credential
                                      final credential =
                                          GoogleAuthProvider.credential(
                                        accessToken: googleAuth?.accessToken,
                                        idToken: googleAuth?.idToken,
                                      );

                                      // Once signed in, return the UserCredential
                                      return await FirebaseAuth.instance
                                          .signInWithCredential(credential);
                                    }
                                  },
                                  child: Text("Google",
                                      style: TextStyle(
                                          fontSize: 30,
                                          color: kBackgroundColor)),
                                ),
                              ],
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
