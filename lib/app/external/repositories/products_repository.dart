import 'package:altf4_produtos/app/external/interfaces/products_interface.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository extends ProductsInterface {
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  List<ProductModel> _productsList = [];

  /**
   * TODO: fazer a lista receber diretamente os dados e lá no main verificar se já tem os dados
   */

  //Future<List<ProductModel>> get productsList async => [..._productsList];

  Future<List<ProductModel>> get fetchProducts async {
    ProductModel product;

    QuerySnapshot querySnapshot = await productsCollection.get();

    querySnapshot.docs.forEach((doc) {
      product = ProductModel.fromJson(doc.data());
      _productsList.add(product);
    });
    return [..._productsList];
  }

  Future<ProductModel> get bestSeller async {
    //return productsList[0];
  }
}
