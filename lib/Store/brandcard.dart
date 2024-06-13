import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Brandcard extends StatelessWidget {
  const Brandcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(right: ESizes.sm),
                    child: const Image(
                        fit: BoxFit.contain,
                        image: AssetImage(
                            "assets/Images/Products/leather_jacket_3.png")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(right: ESizes.sm),
                    child: const Image(
                        fit: BoxFit.contain,
                        image: AssetImage(
                            "assets/Images/Products/tracksuit_blue.png")),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: const EdgeInsets.only(right: ESizes.sm),
                    child: const Image(
                        fit: BoxFit.contain,
                        image: AssetImage(
                            "assets/Images/Products/tshirt_red_collar.png")),
                  ),
                )
              ],
            )
    );
  }
}