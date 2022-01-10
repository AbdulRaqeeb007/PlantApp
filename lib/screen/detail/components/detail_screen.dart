// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:plant_app/screen/detail/components/body.dart';
import 'package:plant_app/screen/home/component/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key,
      required this.title,
      required this.country,
      required this.price,
      required this.image})
      : super(key: key);
  final String title;
  final String country;
  final String price;
  final String image;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Body_detail(
        title: title,
        country: country,
        price: price,
        image: image,
      ),
    );
  }
}
