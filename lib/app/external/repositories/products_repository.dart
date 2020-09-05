import 'package:altf4_produtos/app/external/interfaces/products_interface.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository extends ProductsInterface {
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  List<ProductModel> _productsList = [];

  Future<List<ProductModel>> get fetchProducts async {
    _productsList = [];
    ProductModel product;

    try {
      QuerySnapshot querySnapshot = await productsCollection.get();

      querySnapshot.docs.forEach((doc) {
        product = ProductModel.fromJson(doc.data());
        _productsList.add(product);
      });

      return [..._productsList];
    } catch (error) {
      print('Error when tried to fetch products on repository. ERROR: $error');
      return null;
    }
  }

  Future<ProductModel> get bestSeller async {
    //return productsList[0];
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    try {
      final document = await productsCollection.add(product.toJson());
      await productsCollection.doc(document.id).update({'id': document.id});
      _productsList.add(product);
    } catch (error) {
      print('Error when tried to fetch products. ERROR: $error');
      return null;
    }
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    try {
      await productsCollection.doc(product.id).update(product.toJson());
    } catch (error) {
      print('Error when tried to Update product. ERROR: $error');
    }
  }
}
