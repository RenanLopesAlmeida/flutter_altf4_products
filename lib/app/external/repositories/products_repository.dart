import 'dart:convert';

import 'package:altf4_produtos/app/external/interfaces/products_interface.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository extends ProductsInterface {
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  List<ProductModel> productsList = [];

  Future<List<ProductModel>> get fetchProducts async {
    ProductModel product;

    QuerySnapshot querySnapshot = await productsCollection.get();

    querySnapshot.docs.forEach((doc) {
      product = ProductModel.fromJson(doc.data());
      productsList.add(product);
    });

    return [...productsList];
  }
}
