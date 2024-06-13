import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/authentication/models/Category_model.dart';
import 'package:ecommerce/features/authentication/models/product_model.dart';

class CategoryRepository {
  static final _db = FirebaseFirestore.instance;

  static Future<List<Category_Model>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection("Category")
          .where('IF', isEqualTo: true)
          .get();
      return snapshot.docs.map((doc) => Category_Model.fromSnapshot(doc)).toList();
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }
}