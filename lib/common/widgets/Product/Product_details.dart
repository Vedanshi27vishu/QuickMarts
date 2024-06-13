import 'package:ecommerce/common/widgets/Product/Bottom_cart_bar.dart';
import 'package:ecommerce/common/widgets/Product/Prodduct_Slider.dart';
import 'package:ecommerce/common/widgets/Product/Product_info.dart';
import 'package:ecommerce/common/widgets/Product/Star5.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/Home.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductDetails extends StatelessWidget {
  ProductModel featuredProduct;
   ProductDetails(this.featuredProduct,{super.key});

  @override
  Widget build(BuildContext context) {
    THelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: BottomCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //1-Product Image Slider
            Product_Slider(featuredProduct),

            //2-Product Dating
            Star5(featuredProduct),

            //3-Product Information
            ProductInfo(featuredProduct)
          ],
        ),
      ),
    );
  }
}
