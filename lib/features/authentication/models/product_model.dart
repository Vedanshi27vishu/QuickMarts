import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/authentication/models/brand_model.dart';
import 'package:ecommerce/features/authentication/models/product_attribute_model.dart';
import 'package:ecommerce/features/authentication/models/product_variation_model.dart';

class ProductModel {
  String id;
  String category;
  int stock;
  String? sku;
  String? price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  bool isfav;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String> images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  String image;
  String discount;
  String op;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.date,
   required this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.productAttributes,
    this.productVariations,
    this.categoryId,
    this.description,
    required this.op,
    required this.brand,
    required this.image,
    required this.discount,
    required this.category,
    required this.isfav,
  });
  Map<String, dynamic> toJson2(String field, bool value) {
    return {field: value};
  }

  // static ProductModel empty() => ProductModel(
  //     id: '', title: '', stock: 0, price: 0, thumbnail: '', productType: '');

  // //Json Format
  // toJson() {
  //   return {
  //     'SKU': sku,
  //     'Title': title,
  //     'Stock': stock,
  //     'Price': price,
  //     'Images': images ?? [],
  //     'Thumbnail': thumbnail,
  //     'SalePrice': salePrice,
  //     'IsFeatured': isFeatured,
  //     'CategoryId': categoryId,
  //     'Brand': brand!.toJson(),
  //     'Description': description,
  //     'ProductType': productType,
  //     'ProductAttributes': productAttributes != null
  //         ? productAttributes!.map((e) => e.toJson()).toList()
  //         : [],
  //     'ProductVariations': productAttributes != null
  //         ? productAttributes!.map((e) => e.toJson()).toList()
  //         : [],
  //   };
  // }

  //Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['Isfeatured'] ?? false,
      price: data['Price'] ?? '',
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromSnapshot(data['Brand']),
      image: data['Image'] ?? '',
      discount: data['discount'] ?? '',
      category: data['Category'] ?? '',
      isfav: data['isFav'] ?? '',
      op: data['op']??'',
       images: data['Images']!= null ? List<String>.from(data['Images']) : [],
      // productAttributes: (data['ProductAttributes'] as List<dynamic>)
      //     .map((e) => ProductAttributeModel.fromJson(e))
      //     .toList(),
      // productVariations: (data['ProductVariations'] as List<dynamic>)
      //     .map((e) => ProductVariationModel.fromJson(e))
      //     .toList(),
    );
  }

  //Map Json-oriented ducument snapshot from Firebase to Model
  // factory productModel.fromQuerySnapshot(
  //     QueryDocumentSnapshot<Object?> document) {
  //   final data = document.data() as Map<String, dynamic>;
  //   return ProductModel(
  //     id: document.id,
  //     sku: data['SKU'] ?? '',
  //     title:data['Title'],
  //     stock:data['Stock']??0,
  //     isFeatured: data['IsFeatured']?? false,
  //     price: double.parse

  //   );
  // }
}
