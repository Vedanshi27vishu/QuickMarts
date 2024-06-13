// ignore: file_names
import 'package:ecommerce/Store/brand.dart';
import 'package:ecommerce/Store/clothes.dart';
import 'package:ecommerce/Store/cosmetics.dart';
import 'package:ecommerce/Store/electronics.dart';
import 'package:ecommerce/Store/furniture.dart';
import 'package:ecommerce/Store/sports.dart';
import 'package:ecommerce/common/widgets/Image/Circularimage.dart';
import 'package:ecommerce/common/widgets/Product/TProductCardvertical.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/features/authentication/models/product_repository.dart';
import 'package:ecommerce/features/authentication/screens/navigationscreen.dart/Home.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

RxList<ProductModel> featuredBrands = <ProductModel>[].obs;
RxList<ProductModel> sports = <ProductModel>[].obs;
RxList<ProductModel> furniture = <ProductModel>[].obs;
RxList<ProductModel> electronics = <ProductModel>[].obs;
RxList<ProductModel> cosmetics = <ProductModel>[].obs;
RxList<ProductModel> clothes = <ProductModel>[].obs;

class _ShopState extends State<Shop> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFeaturedProducts();
  }

  void fetchFeaturedProducts() async {
    try {
      final products = await ProductRepository.getFeaturedProducts();
      featuredBrands.addAll(products);
      final productsports = await SportsRepository.getFeaturedProducts();
      sports.addAll(productsports);
      final productfurniture = await FurnitureRepository.getFeaturedProducts();
      furniture.addAll(productfurniture);
      final productelectronics =
          await ElectronicsRepository.getFeaturedProducts();
      electronics.addAll(productelectronics);
      final productcosmetics = await CosmeticRepository.getFeaturedProducts();
      cosmetics.addAll(productcosmetics);
      final productclothes = await ClothesRepository.getFeaturedProducts();
      clothes.addAll(productclothes);
      print("vedanshi hii");
      print(featuredBrands.length);

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Something went wrong:$e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Text(
              "Store",
              style: TextStyle(
                color: dark ? Colors.white : Colors.black,
                fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
              ),
            ),
          ),
          actions: [
            Stack(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: dark ? Colors.white : Colors.black,
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
                        style: Theme.of(context).textTheme.labelLarge!.apply(
                              color: dark ? Colors.white : Colors.black,
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
        body: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : NestedScrollView(
                headerSliverBuilder: (_, innerBoxScrolled) {
                  return [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      pinned: true,
                      floating: true,
                      backgroundColor: THelperFunctions.isDarkMode(context)
                          ? Colors.black
                          : Colors.white,
                      expandedHeight: 350,
                      flexibleSpace: Padding(
                        padding: const EdgeInsets.all(25),
                        child: ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Container(
                                        height: 60,
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          border: Border.all(
                                              color: dark
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                              contentPadding: EdgeInsets.all(8),
                                              hintText: "Search in Store",
                                              prefixIcon: Icon(Icons.search),
                                              border: InputBorder.none),
                                        )),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Featured Brands",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .apply(
                                                  color: dark
                                                      ? Colors.white
                                                      : Colors.black),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text("View All"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: ESizes.spaceBtwItems / 2,
                                  ),
                                  GridView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: ESizes.gridViewSpacig,
                                      crossAxisSpacing: 14,
                                      mainAxisExtent: 55,
                                    ),
                                    itemBuilder: (_, index) =>
                                        FeaturedBrand(featuredBrands[index]),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      bottom: TabBar(
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorColor: ecolor.primary,
                        labelColor: THelperFunctions.isDarkMode(context)
                            ? Colors.white
                            : ecolor.primary,
                        tabs: const [
                          Tab(child: Text('Sports')),
                          Tab(child: Text('Clothes')),
                          Tab(child: Text('Cosmetics')),
                          Tab(child: Text('Electronics')),
                          Tab(child: Text('Furniture')),
                        ],
                      ),
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    shopview(dark: dark, sports),
                    shopview(dark: dark, clothes),
                    shopview(dark: dark, cosmetics),
                    shopview(dark: dark, electronics),
                    shopview(dark: dark, furniture),
                  ],
                )),
      ),
    );
  }
}

// ignore: must_be_immutable
class shopview extends StatelessWidget {
  List<ProductModel> temp;
  shopview(
    this.temp, {
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ESizes.defaultSpace),
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Brands
            BrandCard(dark: dark, temp[0]),
            BrandCard(dark: dark, temp[1]),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: temp.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: ESizes.gridViewSpacig,
                crossAxisSpacing: ESizes.gridViewSpacig,
                mainAxisExtent: 288,
              ),
              itemBuilder: (_, index) => TProductCardvertical(temp[index]),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class BrandCard extends StatelessWidget {
  ProductModel featuredProduct;
  BrandCard(
    this.featuredProduct, {
    super.key,
    required this.dark,
    // required this.images,
  });

//  final List<String> images;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 400,
        decoration: BoxDecoration(
          color: dark ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Brand with Products Count
              Container(
                  //padding: const EdgeInsets.all(ESizes.sm),
                  //color: Colors.transparent,
                  width: 165,
                  height: 56,
                  decoration: BoxDecoration(
                    color: THelperFunctions.isDarkMode(context)
                        ? Colors.black
                        : Colors.white,
                    borderRadius: BorderRadius.circular(10),
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
                            image: AssetImage(featuredProduct.brand!.image),
                            color: dark ? Colors.white : Colors.black,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 9, left: 10),
                          child: Row(
                            children: [
                              Text(featuredProduct.brand!.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color:
                                          dark ? Colors.white : Colors.black)),
                              const SizedBox(width: ESizes.xs),
                              const Icon(Icons.verified,
                                  color: Colors.blue, size: ESizes.iconXs),
                            ],
                          ),
                        ),
                        Text(
                          featuredProduct.brand!.productsCount,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ],
                    )
                  ])),

              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(right: ESizes.sm),
                      child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(featuredProduct.images[0])),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(right: ESizes.sm),
                      child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(featuredProduct.images[1])),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: const EdgeInsets.only(right: ESizes.sm),
                      child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(featuredProduct.images[2])),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget brandTopProduct(String image, context) {
    return const Expanded(
        child: CircularImage(
      height: 100,
      padding: EdgeInsets.all(ESizes.md),
      margin: EdgeInsets.only(right: ESizes.sm),
      image: "assets/Images/Products/tshirt_red_collar.png",
      child: Image(
          fit: BoxFit.contain,
          image: AssetImage("assets/Images/Products/tshirt_red_collar.png")),
    ));
  }
}
