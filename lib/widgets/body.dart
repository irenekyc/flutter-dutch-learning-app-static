import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../style.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 70, horizontal: 20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hello! Dutch Learner!", style: TitleTextStyle),
                  SvgPicture.asset("assets/images/main.svg",
                      height: size.height * 0.5),
                ])));
  }
}
