import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({super.key, required this.image, required int height, required EdgeInsets padding, required EdgeInsets margin, required Image child});
  final String image;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: dark ? Colors.black : Colors.white,
            borderRadius: BorderRadius.circular(100)),
        child: Image(
          image: AssetImage(image),
         // color: dark ? Colors.white : Colors.black,
        ));
  }
}
