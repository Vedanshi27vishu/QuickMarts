import 'package:ecommerce/common/widgets/Product/product_variation.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  ProductModel featuredProduct;
   ProductInfo(
    this.featuredProduct,{super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
        children: [
          ///Sale Tag
          Padding(
            padding: const EdgeInsets.only(left: 28),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ecolor.secondary.withOpacity(0.8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 5),
              child:  Text(
                featuredProduct.discount,
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),

          ///Price Tag
          Text(
          '\u20B9' + ' ' + featuredProduct.op,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .apply(decoration: TextDecoration.lineThrough),
          ),
          const SizedBox(width: 20),
          Text(
            '\u20B9'+" "+featuredProduct.price!,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(decoration: TextDecoration.none),
          ),
        ],
      ),
      const SizedBox(
        height: 8,
      ),

      //Title
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          featuredProduct.title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      const SizedBox(
        height: 6,
      ),

      //Stack Status
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            Text("Status", style: Theme.of(context).textTheme.titleSmall),
            const SizedBox(
              width: 20,
            ),
            Text(
              "In Stock",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Padding(
        padding: const EdgeInsets.all(4),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: dark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Image(
                    image: AssetImage(featuredProduct.brand!.image),
                    color: dark ? Colors.white : Colors.black,
                  )),
            ),
            Text(featuredProduct.brand!.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                    fontStyle:
                        Theme.of(context).textTheme.labelLarge!.fontStyle,
                    color: Colors.grey)),
            const SizedBox(width: ESizes.xs),
            const Icon(Icons.verified,
                color: ecolor.primary, size: ESizes.iconXs),
          ],
        ),
      ),

      ProductVariation(featuredProduct),
    ]);
  }
}
