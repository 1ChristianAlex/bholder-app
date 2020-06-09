import 'package:bholderapp/src/contansts/images.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 25,
        top: 25,
      ),
      width: double.infinity,
      padding: EdgeInsets.all(50),
      child: Image(
        image: BholderImages.logo,
        width: double.infinity,
      ),
    );
  }
}
