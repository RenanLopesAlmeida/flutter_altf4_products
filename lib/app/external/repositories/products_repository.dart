import 'package:altf4_produtos/app/external/interfaces/products_interface.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';

class ProductsRepository extends ProductsInterface {
  CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  ObservableList<ProductModel> _productsList = ObservableList<ProductModel>();

  get productsList => _productsList;

  @override
  Future<ObservableList<ProductModel>> get fetchProducts async {
    _productsList = ObservableList<ProductModel>();
    ProductModel product;

    try {
      QuerySnapshot querySnapshot = await productsCollection.get();

      querySnapshot.docs.forEach((doc) {
        product = ProductModel.fromJson(doc.data());
        _productsList.add(product);
      });
      return _productsList;
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
      await fetchProducts;
      print('tamanho da lista no repository ANTES: ${_productsList.length}');
      final document = await productsCollection.add(product.toJson());
      await productsCollection.doc(document.id).update({'id': document.id});
      await fetchProducts;
      //_productsList.add(product);
      print('tamanho da lista no repository DEPOIS: ${_productsList.length}');
      //_productsList = List.from(_productsList..add(product));
    } catch (error) {
      print('Error when tried to fetch products. ERROR: $error');
      return null;
    }
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    try {
      await fetchProducts;
      await productsCollection.doc(product.id).update(product.toJson());
      await fetchProducts;
      // final index =
      //     _productsList.indexWhere((element) => element.id == product.id);
      // _productsList[index] = product;
      //await fetchProducts;
    } catch (error) {
      print('Error when tried to Update product. ERROR: $error');
    }
  }

  @override
  Future<void> deleteProduct(String productId) async {
    print('Lista antes: ${_productsList.length}');
    try {
      await productsCollection.doc(productId).delete();
      await fetchProducts;
      // _productsList.removeWhere((element) => element.id == productId);
    } catch (error) {
      print('error when tried to delete a product. ERROR: $error');
    }
  }

  @override
  Future<ProductModel> searchProductById(String productId) async {
    final snapshot =
        await productsCollection.where('id', isEqualTo: productId).get();
    final product = ProductModel.fromJson(snapshot.docs[0].data());

    return product;
  }
}
