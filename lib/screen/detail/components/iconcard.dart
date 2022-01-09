import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_app/constants.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    this.icon,
  }) : super(key: key);
  final icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(kDefaultPadding / 2),
      padding: EdgeInsets.symmetric(vertical: size.height * 0.02),
      height: 65,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 1),
              blurRadius: 22,
              color: kPrimaryColor.withOpacity(.23)),
          BoxShadow(
              offset: Offset(-15, -15), blurRadius: 22, color: Colors.white)
        ],
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
