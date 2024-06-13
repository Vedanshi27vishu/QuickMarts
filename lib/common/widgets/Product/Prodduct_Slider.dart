import 'package:ecommerce/Store/Favourite.dart';
import 'package:ecommerce/common/widgets/Image/t_rounded_image.dart';
import 'package:ecommerce/common/widgets/curvededges/curve.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class Product_Slider extends StatefulWidget {
   final ProductModel featuredProduct;
   Product_Slider(
  this.featuredProduct,
  {
    super.key,
  });

  @override
  State<Product_Slider> createState() => _Product_SliderState();
}

class _Product_SliderState extends State<Product_Slider> {
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = widget.featuredProduct.image; // Initialize with the main image
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return tcurve(
        child: Container(
            color: dark ? ecolor.darkgrey : ecolor.light,
            child: Stack(
              children: [
                SizedBox(
                    height: 400,
                    child: Padding(
                      padding: EdgeInsets.all(16.0 * 2),
                      child: Center(
                          child: Image(
                              image: AssetImage(selectedImage))),
                    )),
                Positioned(
                  right: 0,
                  bottom: 30,
                  left: 24,
                  child: SizedBox(
                    height: 70,
                    child: ListView.separated(
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemCount: widget.featuredProduct.images.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemBuilder: (_, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedImage = widget.featuredProduct.images[index];
                          });
                        },
                        child: Container(
                          width: 80,
                          height: 150,
                          child: RoundedImage(
                            // backgroundColor: dark ? ecolor.dark : ecolor.white,
                            border: Border.all(color: ecolor.primary),
                            imageUrl: widget.featuredProduct.images[index],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AppBar(
                  automaticallyImplyLeading: true,
                  actions: [],
                )
              ],
            )));
  }
}

