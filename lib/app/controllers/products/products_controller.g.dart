// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsController on _ProductsControllerBase, Store {
  Computed<List<ProductModel>> _$getListComputed;

  @override
  List<ProductModel> get getList =>
      (_$getListComputed ??= Computed<List<ProductModel>>(() => super.getList,
              name: '_ProductsControllerBase.getList'))
          .value;

  final _$searchedProductAtom =
      Atom(name: '_ProductsControllerBase.searchedProduct');

  @override
  String get searchedProduct {
    _$searchedProductAtom.reportRead();
    return super.searchedProduct;
  }

  @override
  set searchedProduct(String value) {
    _$searchedProductAtom.reportWrite(value, super.searchedProduct, () {
      super.searchedProduct = value;
    });
  }

  final _$_productsListAtom =
      Atom(name: '_ProductsControllerBase._productsList');

  @override
  ObservableList<ProductModel> get _productsList {
    _$_productsListAtom.reportRead();
    return super._productsList;
  }

  @override
  set _productsList(ObservableList<ProductModel> value) {
    _$_productsListAtom.reportWrite(value, super._productsList, () {
      super._productsList = value;
    });
  }

  final _$fetchProductsAsyncAction =
      AsyncAction('_ProductsControllerBase.fetchProducts');

  @override
  Future<List<ProductModel>> fetchProducts() {
    return _$fetchProductsAsyncAction.run(() => super.fetchProducts());
  }

  final _$addProductAsyncAction =
      AsyncAction('_ProductsControllerBase.addProduct');

  @override
  Future<void> addProduct(ProductModel product) {
    return _$addProductAsyncAction.run(() => super.addProduct(product));
  }

  final _$updateProductAsyncAction =
      AsyncAction('_ProductsControllerBase.updateProduct');

  @override
  Future<void> updateProduct(ProductModel product) {
    return _$updateProductAsyncAction.run(() => super.updateProduct(product));
  }

  final _$deleteProductAsyncAction =
      AsyncAction('_ProductsControllerBase.deleteProduct');

  @override
  Future<void> deleteProduct(String productId) {
    return _$deleteProductAsyncAction.run(() => super.deleteProduct(productId));
  }

  final _$searchProductByIdAsyncAction =
      AsyncAction('_ProductsControllerBase.searchProductById');

  @override
  Future<ProductModel> searchProductById(String productId) {
    return _$searchProductByIdAsyncAction
        .run(() => super.searchProductById(productId));
  }

  final _$_ProductsControllerBaseActionController =
      ActionController(name: '_ProductsControllerBase');

  @override
  void setSearchedProduct(String product) {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.setSearchedProduct');
    try {
      return super.setSearchedProduct(product);
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
searchedProduct: ${searchedProduct},
getList: ${getList}
    ''';
  }
}
