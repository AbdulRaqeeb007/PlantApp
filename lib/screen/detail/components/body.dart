// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';

import 'iconcard.dart';
import 'imageandiconcard.dart';
import 'titleandprice.dart';

class Body_detail extends StatelessWidget {
  const Body_detail(
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
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIconCard(
            image: image,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TilteAndPrice(
              title: title,
              country: country,
              price: price,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                    width: size.width / 2,
                    height: 84,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("BUY"),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30)))),
                    )),
              ),
              SizedBox(
                  width: size.width / 2,
                  height: 84,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "DESCRIPTION",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: kBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30)))),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
