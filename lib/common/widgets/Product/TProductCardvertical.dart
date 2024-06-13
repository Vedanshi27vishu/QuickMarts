// ignore: file_names
import 'package:ecommerce/Store/Favourite.dart';
import 'package:ecommerce/common/styles/shadows.dart';
import 'package:ecommerce/common/widgets/Image/t_rounded_image.dart';
import 'package:ecommerce/common/widgets/Product/Product_details.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TProductCardvertical extends StatefulWidget {
  final ProductModel featuredProduct;
  TProductCardvertical(this.featuredProduct, {super.key});

  @override
  State<TProductCardvertical> createState() => _TProductCardverticalState();
}

class _TProductCardverticalState extends State<TProductCardvertical> {
  late bool isfav;

  @override
  void initState() {
    super.initState();
    isfav = widget.featuredProduct.isfav ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(widget.featuredProduct),
          ),
        );
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(20),
          color: dark ? const Color.fromARGB(255, 108, 108, 108) : Colors.white,
        ),
        child: Column(
          children: [
            // Thumbnail Image
            Container(
              height: 180,
              padding: const EdgeInsets.all(3),
              child: Stack(
                children: [
                  // Thumbnail image
                  RoundedImage(
                    imageUrl: widget.featuredProduct.image,
                    applyImageRadius: true,
                  ),

                  // Sale Tag
                  if (widget.featuredProduct.discount.isNotEmpty)
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ecolor.secondary.withOpacity(0.8),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        child: Text(
                          widget.featuredProduct.discount,
                          style: const TextStyle(fontSize: 10, color: Colors.black),
                        ),
                      ),
                    ),

                  // Favourite Icon Button
                  Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          isfav = !isfav;
                        });
                        FavouriteRepo.updateuserRecord(
                          widget.featuredProduct,
                          isfav,
                        );
                      },
                      icon: Icon(
                        isfav ? Icons.favorite : Icons.favorite_border_outlined,
                        color: isfav ? Colors.red : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    widget.featuredProduct.title,
                    style: Theme.of(context).textTheme.labelLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: ESizes.spaceBtwItems / 2),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Row(
                      children: [
                        Text(
                          widget.featuredProduct.brand!.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontStyle: Theme.of(context).textTheme.labelLarge!.fontStyle,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(width: ESizes.xs),
                        const Icon(Icons.verified, color: ecolor.primary, size: ESizes.iconXs),
                      ],
                    ),
                  ),
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\u20B9 ${widget.featuredProduct.price!}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: ecolor.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(ESizes.cardRadiusMd),
                            bottomRight: Radius.circular(ESizes.productImagesRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: ESizes.iconLg * 1.2,
                          height: ESizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: ecolor.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
