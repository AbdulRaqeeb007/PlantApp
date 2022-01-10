import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/screen/home/component/postscreen/more.dart';

import '../../../constants.dart';

class TitleWithMoreBtn extends StatelessWidget {
  const TitleWithMoreBtn({
    Key? key,
    required this.title,
    required this.press,
    required this.text,
  }) : super(key: key);
  final String title;
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Row(
          children: <Widget>[
            TitleWithCustomUnderline(text: title),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.to(UserInformation());
              },
              child: Text(text),
              style: OutlinedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                shape: StadiumBorder(),
              ),
              // style: ButtonStyle(
              //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20),
              //             side: BorderSide(color: kPrimaryColor))
              //             ))
            )
          ],
        ),
      ),
    );
  }
}

class TitleWithCustomUnderline extends StatelessWidget {
  const TitleWithCustomUnderline({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 24,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: kDefaultPadding / 4),
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(right: kDefaultPadding / 4),
              height: 7,
              color: kPrimaryColor.withOpacity(0.2),
            ),
          )
        ],
      ),
    );
  }
}
