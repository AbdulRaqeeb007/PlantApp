// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/constants.dart';
import 'package:plant_app/screen/detail/components/detail_screen.dart';

class RecommendedPlants extends StatelessWidget {
  const RecommendedPlants({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          RecommandedPlantCard(
            country: "Pakistan",
            title: "Rose",
            image: "assets/images/image_2.png",
            price: "33",
          ),
          RecommandedPlantCard(
            country: "Pakistan",
            title: "jasmin",
            image: "assets/images/image_3.png",
            price: "133",
          ),
          RecommandedPlantCard(
            country: "Pakistan",
            title: "Flower",
            image: "assets/images/image_1.png",
            price: "233",
          ),
          // ListView.builder(
          //   itemCount: 5,
          //   itemBuilder: (BuildContext context, int index) {
          //     return RecommandedPlantCard(
          //       country: "Pakistan",
          //       title: "Rose",
          //       image: "assets/images/image_1.png",
          //       price: 33,
          //       press: () {},
          //     );
          //   },
          // )
        ],
      ),
    );
  }
}

class RecommandedPlantCard extends StatelessWidget {
  const RecommandedPlantCard({
    Key? key,
    required this.image,
    required this.title,
    required this.country,
    required this.price,
  }) : super(key: key);
  final String image, title, country;
  final String price;

  @override
  Widget build(BuildContext context) {
    press() {
      Get.to(DetailScreen(
          title: title, country: country, price: price, image: image));
    }

    Size size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.only(left: kDefaultPadding, bottom: kDefaultPadding * 2.5),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(.23))
                  ]),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                    TextSpan(
                        text: title, style: Theme.of(context).textTheme.button),
                    TextSpan(
                        text: "\n$country",
                        style: TextStyle(color: kPrimaryColor))
                  ]))),
                  Text('\$$price')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
