import 'package:ecommerce/Store/Favourite.dart';
import 'package:ecommerce/common/widgets/Product/TProductCardvertical.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';
import 'package:ecommerce/features/authentication/models/product_repository.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  RxList<ProductModel> featuredFavourite = <ProductModel>[].obs;

  @override
  void initState() {
    super.initState();
    fetchFeaturedProducts(); // Fetch products on initialization
  }

  Future<void> fetchFeaturedProducts() async {
    try {
      final heart = await FavouriteRepo.getFeaturedProducts();
      featuredFavourite.assignAll(heart); // Using assignAll to replace old data
      print("Fetched products successfully.");
      print(featuredFavourite.length);
    } catch (e) {
      print("Something went wrong: $e");
    }
  }

  Future<void> _refreshData() async {
    await fetchFeaturedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: Obx(
        () => RefreshIndicator(
          onRefresh: _refreshData, // Add pull-to-refresh functionality
          child: GridView.builder(
            physics:
                const AlwaysScrollableScrollPhysics(), // Change physics to AlwaysScrollableScrollPhysics
            itemCount: featuredFavourite.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: ESizes.gridViewSpacig,
              crossAxisSpacing: ESizes.gridViewSpacig,
              mainAxisExtent: 288,
            ),
            itemBuilder: (_, index) =>
                TProductCardvertical(featuredFavourite[index]),
          ),
        ),
      ),
    );
  }
}
