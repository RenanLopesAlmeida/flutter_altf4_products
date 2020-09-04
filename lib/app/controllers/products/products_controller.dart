import 'package:altf4_produtos/app/external/repositories/products_repository.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'products_controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  final _productsRepository = ProductsRepository();

  @observable
  List<ProductModel> _productsList = [];

  Future<List<ProductModel>> get productsList async {
    _productsList = await _productsRepository.fetchProducts;
    return _productsList;
  }
}
