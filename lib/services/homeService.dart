import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoriesRef =
      FirebaseFirestore.instance.collection("Categories");
  final CollectionReference _productRef =
      FirebaseFirestore.instance.collection("Productes");

  Future<List<QueryDocumentSnapshot>> getBestProduct() async {
    var value = await _productRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getCategories() async {
    var value = await _categoriesRef.get();
    return value.docs;
  }
}
