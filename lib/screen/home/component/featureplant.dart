import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class FeaturePlant extends StatelessWidget {
  const FeaturePlant({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Featurecard(
            img: 'assets/images/bottom_img_1.png',
            press: () {},
          ),
          Featurecard(
            img: 'assets/images/bottom_img_2.png',
            press: () {},
          ),
          Featurecard(
            img: 'assets/images/img.png',
            press: () {},
          )
        ],
      ),
    );
  }
}

class Featurecard extends StatelessWidget {
  const Featurecard({
    Key? key,
    this.img,
    required this.press,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final img;
  final Function press;
  pres() {
    press;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: pres,
      child: Container(
        margin: EdgeInsets.all(kDefaultPadding),
        width: size.width * 0.5,
        height: 198,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(fit: BoxFit.cover, image: AssetImage(img))),
      ),
    );
  }
}
