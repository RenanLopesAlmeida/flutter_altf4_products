import 'package:altf4_produtos/app/external/interfaces/products_interface.dart';
import 'package:altf4_produtos/app/external/repositories/products_repository.dart';
import 'package:altf4_produtos/app/shared/models/product_model.dart';
import 'package:mobx/mobx.dart';
part 'products_controller.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  ProductsInterface _productsRepository = ProductsRepository();

  @observable
  ObservableList<ProductModel> _productsList = ObservableList<ProductModel>();

  ObservableList<ProductModel> get productsList => _productsList;

  @observable
  String searchedProductId;

  @action
  void setSearchedProduct(String productId) {
    searchedProductId = productId;
  }

  @action
  Future<List<ProductModel>> fetchProducts() async {
    try {
      _productsList = await _productsRepository.fetchProducts.asObservable();
      return _productsList.toList();
    } catch (error) {
      print(
          'ERROR when tried to get product list in productsController. ERROR: $error');
      return null;
    }
  }

  @computed
  List<ProductModel> get getList => [..._productsList];

  @action
  Future<void> addProduct(ProductModel product) async {
    await _productsRepository.addProduct(product);
    _productsList.add(product);
    await fetchProducts();
  }

  Future<ProductModel> get bestSeller async {
    try {
      return await _productsRepository.bestSeller;
    } catch (error) {
      print('error when tried to fetch best seller product');
      throw error;
    }
  }

  @action
  Future<void> updateProduct(ProductModel product) async {
    try {
      await _productsRepository.updateProduct(product);
      await fetchProducts();
    } catch (error) {
      print('Could not update product in product controller. ERROR: $error');
    }
  }

  @action
  Future<void> deleteProduct(String productId) async {
    try {
      await _productsRepository.deleteProduct(productId.trim());
      await fetchProducts();
    } catch (error) {
      print('Error when tried to delete a product. ERROR: $error');
    }
  }

  @action
  Future<ProductModel> searchProductById() async {
    try {
      if (searchedProductId != null && searchedProductId.isNotEmpty) {
        return await _productsRepository.searchProductById(searchedProductId);
      }

      return null;
    } catch (error) {
      print('Error when tried to search product in controller. ERROR: $error');
      throw error;
    }
  }
}
