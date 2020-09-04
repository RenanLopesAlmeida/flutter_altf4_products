import 'package:altf4_produtos/app/shared/models/product_model.dart';

abstract class ProductsInterface {
  Future<List<ProductModel>> get fetchProducts;
  //Future<List<ProductModel>> get productsList;
  Future<ProductModel> get bestSeller;
}
