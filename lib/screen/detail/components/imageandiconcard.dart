// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plant_app/constants.dart';

import 'iconcard.dart';

class ImageAndIconCard extends StatelessWidget {
  const ImageAndIconCard({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * .8,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      padding:
                          EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset('assets/icons/back_arrow.svg')),
                ),
                Spacer(),
                Container(
                  margin: EdgeInsets.only(bottom: kDefaultPadding * 3),
                  child: Column(
                    children: [
                      IconCard(
                        icon: 'assets/icons/sun.svg',
                      ),
                      IconCard(
                        icon: 'assets/icons/icon_2.svg',
                      ),
                      IconCard(
                        icon: 'assets/icons/icon_3.svg',
                      ),
                      IconCard(
                        icon: 'assets/icons/icon_4.svg',
                      )
                    ],
                  ),
                )
              ],
            )),
            Container(
                height: size.height * 0.8,
                width: size.width * 0.70,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.35))
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        bottomLeft: Radius.circular(40)),
                    image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover,
                        image: NetworkImage(image))))
          ],
        ),
      ),
    );
  }
}
