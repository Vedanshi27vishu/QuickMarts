// ignore: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/widgets/Product/TProductCardvertical.dart';
import 'package:ecommerce/common/widgets/containers/tcircular.dart';
import 'package:ecommerce/common/widgets/curvededges/curve.dart';
import 'package:ecommerce/features/authentication/models/Category_model.dart';
import 'package:ecommerce/features/authentication/models/Category_repository.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/features/authentication/models/product_repository.dart';
import 'package:ecommerce/user/user_model.dart';
import 'package:ecommerce/user/user_repo.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  final UserModel? usermodel;
   Home(
  {
    super.key,
    required this.usermodel,
  });

  @override
  State<Home> createState() => _HomeState();
}

RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
RxList<Category_Model> categoryProducts = <Category_Model>[].obs;

class _HomeState extends State<Home> {
 
  int x = 0;
  @override
  void initState() {
    fetchFeaturedProducts(); //product aa rhe hain
    super.initState(); //home screen ban rhi hai
  }


  void fetchFeaturedProducts() async {
    try {
      final products = await ProductRepository.getFeaturedProducts();
      featuredProducts.addAll(products);
      final category = await CategoryRepository.getFeaturedProducts();
      categoryProducts.addAll(category);
      print("vedanshi hii");
      print(categoryProducts.length);
    } catch (e) {
      print("Something went wrong:$e");
    }
  }

  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    UserModel? userdata = widget.usermodel;
    
    return Scaffold(
        //  bottomNavigationBar:  NavigationMenu(usermodel: widget.usermodel),
        body: SingleChildScrollView(
      child: FutureBuilder(
        builder: (context, snapshot) {
          return Column(children: [
            Column(
              children: [
                tcurve(
                  child: Container(
                    color: ecolor.primary,
                    padding: const EdgeInsets.all(0),
                    child: SizedBox(
                      height: 355,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Positioned(
                            top: -150,
                            right: -250,
                            child: Tcircular(
                              backgroundColor: ecolor.white.withOpacity(0.1),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            right: -300,
                            child: Tcircular(
                              backgroundColor: ecolor.white.withOpacity(0.1),
                            ),
                          ),
                          AppBar(
                            automaticallyImplyLeading: false,
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " Good day for shopping!",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .fontSize,
                                  ),
                                ),
                                Text(
                                  widget.usermodel!.firstName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .fontSize,
                                  ),
                                ),
                              ],
                            ),
                            actions: [
                              Stack(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    right: 2,
                                    child: SizedBox(
                                      width: 18,
                                      height: 18,
                                      child: Center(
                                        child: Text(
                                          '2',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .apply(
                                                color: Colors.white,
                                                fontSizeFactor: 1.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 110, horizontal: 20),
                                child: Container(
                                    height: 60,
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: dark ? Colors.black : Colors.white,
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: dark
                                              ? Colors.black
                                              : Colors.white),
                                    ),
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                          contentPadding: EdgeInsets.all(7),
                                          hintText: "Search in Store",
                                          border: InputBorder.none,
                                          prefixIcon: Icon(Icons.search)),
                                    )),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 190, left: 15),
                                child: Text(
                                  "Popular Categories",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .fontSize,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 10),
                              // scrollable circles/products
                              Padding(
                                padding: const EdgeInsets.only(top: 0, left: 7),
                                child: SizedBox(
                                  height: 91,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: categoryProducts.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (_, index) {
                                      //final category = CategoryProducts[index];
                                      // Return the container with the circle widget
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: 60,
                                              padding: const EdgeInsets.all(ESizes
                                                  .sm), // Adjust padding as needed
                                              decoration: BoxDecoration(
                                                color: Colors
                                                    .white, // Use Colors.white instead of ecolor.white if ecolor is not defined
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                child: Image.asset(
                                                    categoryProducts[index].image,
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                             SizedBox(
                                                height:
                                                    ESizes.spaceBtwItems / 2),
                                            Text(
                                             categoryProducts[index].name ,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .apply(color: Colors.white),
                                            ), // Add space between circles if needed
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: (index, _) {
                        x = index;
                        setState(() {});
                      },
                    ),
                    items: [
                      Container(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(ESizes.md),
                        child: Image.asset(
                          "assets/Images/banners/banner_1.jpg",
                        ),
                      )),
                      Container(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(ESizes.md),
                        child:
                            Image.asset("assets/Images/banners/banner_2.jpg"),
                      )),
                      Container(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(ESizes.md),
                        child:
                            Image.asset("assets/Images/banners/banner_3.jpg"),
                      )),
                      Container(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(ESizes.md),
                        child:
                            Image.asset("assets/Images/banners/banner_4.jpg"),
                      )),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    width: 25,
                    height: 5,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(400),
                      color: x == i ? ecolor.primary : Colors.grey,
                    ),
                  ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    "Popular Categories",
                    style: TextStyle(
                        color: dark ? Colors.black : Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5),
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: featuredProducts.length,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: ESizes.gridViewSpacig,
                    crossAxisSpacing: ESizes.gridViewSpacig,
                    mainAxisExtent: 288,
                  ),
                  itemBuilder: (_, index) =>
                      TProductCardvertical(featuredProducts[index]),
                ),
              ],
            ),
          ]);
        },
        future: UserRepository.getuserData(),
      ),
    ));
  }
}
