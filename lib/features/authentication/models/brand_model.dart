class BrandModel {
  String id;
  String name;
  String image;
  bool isFeatured;
 String productsCount;

  BrandModel(
      {required this.id,
      required this.image,
      required this.name,
     required this.isFeatured,
     required this.productsCount});
  //Empty Helper Function
  // static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  // //Convert model to Json structure so that you can store data in firebase
  // toJson() {
  //   return {
  //     'Id': id,
  //     'Name': name,
  //     'Image': image,
  //     'ProductsCount': productsCount,
  //     'IsFeatured': isFeatured,
  //   };
  // }

  //Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromSnapshot(Map<String, dynamic> document) {
    final data = document;
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['image'] ?? '',
      isFeatured: data['IsFeatured']?? false,
      productsCount: data['ProductCount']??'',
    );
  }

  // factory BrandModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> document) {
  //   if (document.data() != null) {
  //     final data = document.data()!;

  //     return BrandModel(
  //       id: document.id,
  //       name: data['Name'] ?? '',

  //     );
  //   }
  // }
}
