import 'package:altf4_produtos/app/shared/models/product_model.dart';

abstract class ProductsInterface {
  Future<List<ProductModel>> get fetchProducts;
  Future<void> addProduct(ProductModel product);
  Future<void> updateProduct(ProductModel product);
  Future<ProductModel> get bestSeller;
}
