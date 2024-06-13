import 'package:ecommerce/common/widgets/Product/color_circle.dart';
import 'package:ecommerce/common/widgets/Product/product_review.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/Home.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductVariation extends StatelessWidget {
  ProductModel featuredProduct;
 ProductVariation(this.featuredProduct,{super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: dark ? ecolor.darkgrey : Colors.grey,
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Row(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Variation",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Price",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '\u20B9' + ' ' + featuredProduct.op,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '\u20B9' + ' ' + featuredProduct.price!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .apply(decoration: TextDecoration.none),
                              ),
                            ],
                          ),

                          //Stock
                          Row(
                            children: [
                              Text(
                                "Stock",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'In Stock',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .apply(decoration: TextDecoration.none),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                  "Discover "+featuredProduct.title+" , combining high-quality materials with innovative design for exceptional performance and durability. Experience the difference today.",
                      
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ],
              )),
        ),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Colors",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 215,
                ),
                TextButton(onPressed: () {}, child: const Text("View All")),
              ],
            ),
          ),
          Wrap(
            children: [
              ColorCircle(
                text: "Green",
                selected: false,
                onSelected: (value) {},
              ),
              ColorCircle(
                text: "Blue",
                selected: true,
                onSelected: (value) {},
              ),
              ColorCircle(
                text: "Yellow",
                selected: false,
                onSelected: (value) {},
              ),
            ],
          ),
        ]),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Text("Size",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 235,
                ),
                TextButton(onPressed: () {}, child: const Text("View All")),
              ],
            ),
          ),
          Wrap(
            children: [
              ColorCircle(
                text: "EU 34",
                selected: true,
                onSelected: (value) {},
              ),
              ColorCircle(
                text: "EU 36",
                selected: false,
                onSelected: (value) {},
              ),
              ColorCircle(
                text: "EU 38",
                selected: false,
                onSelected: (value) {},
              ),
            ],
          ),
        ]),
        const SizedBox(
          height: 32,
        ),
        SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text('Checkout'))),
        const SizedBox(
          height: 32,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 230),
          child: Text("Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
         Padding(
          padding: EdgeInsets.all(8.0),
          child: ReadMoreText(
            "Discover "+featuredProduct.title+" , crafted with precision and care. This product combines high-quality materials with innovative design to deliver exceptional performance and durability. Whether you're a professional or an enthusiast, "+featuredProduct.description!+" is engineered to exceed your expectations and meet your needs.",
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: ' Show more',
            trimExpandedText: '  Show Less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        const Divider(),
        const SizedBox(height: 8),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Text("Reviews(199)",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(
                  width: 165,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductReview()));
                    },
                    icon: Icon(
                      Icons.arrow_right,
                      size: 25,
                    )),
              ],
            ),
          )
        ]),
      ],
    );
  }
}
