// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/home/component/postscreen/more.dart';

import 'featureplant.dart';
import 'headerwithsearchbox.dart';
import 'recommendedplants.dart';
import 'titlewithunderline.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          HeaderWithSearchBar(size: size),
          TitleWithMoreBtn(
            title: 'Recommended',
            text: 'More',
            press: () {},
          ),
          RecommendedPlants(),
          TitleWithMoreBtn(title: "Featured", press: () {}, text: "More"),
          FeaturePlant()
        ],
      ),
    );
  }
}
