import "package:flutter/material.dart";
import 'package:plant_app/constants.dart';

class TextFild extends StatelessWidget {
  TextFild({required this.hinttext, required this.controll});
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
