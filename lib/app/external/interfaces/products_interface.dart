import 'package:altf4_produtos/app/shared/models/product_model.dart';

abstract class ProductsInterface {
  Future<List<ProductModel>> get fetchProducts;
}
