// ignore: file_names
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:flutter/material.dart';

class Star5 extends StatelessWidget {
  ProductModel featuredProduct;
   Star5(
    this.featuredProduct,{
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          right: 24,
          left: 24,
        ),
        child: Column(
          children: [
            ////Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(children: [
                        TextSpan(
                            text: "5.0",
                            style: Theme.of(context).textTheme.bodyLarge),
                        const TextSpan(text: " (199) ")
                      ])
                    ]))
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.share,
                      size: 24.0,
                    ))
              ],
            )
          ],
        ));
  }
}
