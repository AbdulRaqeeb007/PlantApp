// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';

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
            press: () {},
            text: 'More',
          ),
          RecommendedPlants(),
          TitleWithMoreBtn(title: "Featured", press: () {}, text: "More"),
          FeaturePlant()
        ],
      ),
    );
  }
}
