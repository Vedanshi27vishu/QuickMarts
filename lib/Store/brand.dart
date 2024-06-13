import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/features/authentication/models/product_repository.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/Shop.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class FeaturedBrand extends StatelessWidget {
  ProductModel featuredBrand;
 FeaturedBrand(this.featuredBrand, {super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
          
          //padding: const EdgeInsets.all(ESizes.sm),
          //color: Colors.transparent,
          width: 165,
          height: 56,
          decoration: BoxDecoration(
            color: THelperFunctions.isDarkMode(context)
                ? Colors.black
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: dark ? Colors.white : Colors.black, width: 1),
          ),
          child: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: dark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Image(
                    image: AssetImage(
                        featuredBrand.brand!.image),
                    color: dark ? Colors.white : Colors.black,
                  )),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9, left: 10),
                  child: Row(
                    children: [
                      Text(featuredBrand.brand!.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: dark ? Colors.white : Colors.black)),
                      const SizedBox(width: ESizes.xs),
                      const Icon(Icons.verified,
                          color: Colors.blue, size: ESizes.iconXs),
                    ],
                  ),
                ),
                Text(
                  featuredBrand.brand!.productsCount,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ])),
    );
  }
}
