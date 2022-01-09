// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plant_app/constants.dart';

class TilteAndPrice extends StatelessWidget {
  const TilteAndPrice({
    Key? key,
    required this.title,
    required this.country,
    required this.price,
  }) : super(key: key);
  final String title;
  final String country;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        children: <Widget>[
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: "$title\n",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    ?.copyWith(color: kTextColor, fontWeight: FontWeight.bold)),
            TextSpan(
                text: "$country",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20))
          ])),
          Spacer(),
          Text('\$$price',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: kTextColor, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
