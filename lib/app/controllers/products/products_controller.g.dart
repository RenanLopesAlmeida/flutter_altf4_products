// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsController on _ProductsControllerBase, Store {
  final _$_productsListAtom =
      Atom(name: '_ProductsControllerBase._productsList');

  @override
  List<ProductModel> get _productsList {
    _$_productsListAtom.reportRead();
    return super._productsList;
  }

  @override
  set _productsList(List<ProductModel> value) {
    _$_productsListAtom.reportWrite(value, super._productsList, () {
      super._productsList = value;
    });
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

  @override
  String toString() {
    return '''

    ''';
  }
}
