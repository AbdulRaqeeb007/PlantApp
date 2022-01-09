// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:plant_app/screen/detail/components/body.dart';
import 'package:plant_app/screen/home/component/body.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Body_detail(
        title: "abc",
        country: "cad",
        price: "dac",
        image: '',
      ),
    );
  }
}
