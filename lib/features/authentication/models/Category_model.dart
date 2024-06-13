import 'package:cloud_firestore/cloud_firestore.dart';

class Category_Model {
  String name;
  bool iF;
  String image;

  Category_Model({
    required this.name,
    required this.iF,
    required this.image,
  });

  factory Category_Model.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Category_Model(name: data['Name'] ?? '', iF: data['IF'] ?? '',image: data['Images']??'',);
  }
}
