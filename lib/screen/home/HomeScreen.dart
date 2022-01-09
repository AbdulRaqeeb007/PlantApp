// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/home/component/body.dart';
import 'package:plant_app/screen/home/component/sellscreen.dart';
import 'package:plant_app/screen/signin/signscreen.dart';

import 'component/drawer.dart';
import 'component/my_bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: newMethod(),
      body: Body(),
      bottomNavigationBar: my_bottom_nav_bar(),
      drawer: Container(
          width: MediaQuery.of(context).size.width / 1.5, child: Drawerrr()),
    );
  }

  AppBar newMethod() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      // leading: IconButton(
      //     onPressed: () {
      //       Get.to(Drawerrr());
      //     },
      //     icon: SvgPicture.asset('assets/icons/menu.svg')),
    );
  }
}
