// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductModel on _ProductModelBase, Store {
  final _$nameAtom = Atom(name: '_ProductModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$quantityAtom = Atom(name: '_ProductModelBase.quantity');

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  final _$priceAtom = Atom(name: '_ProductModelBase.price');

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$imageUrlAtom = Atom(name: '_ProductModelBase.imageUrl');

  @override
  String get imageUrl {
    _$imageUrlAtom.reportRead();
    return super.imageUrl;
  }

  @override
  set imageUrl(String value) {
    _$imageUrlAtom.reportWrite(value, super.imageUrl, () {
      super.imageUrl = value;
    });
  }

  final _$_ProductModelBaseActionController =
      ActionController(name: '_ProductModelBase');

  @override
  dynamic setName(String name) {
    final _$actionInfo = _$_ProductModelBaseActionController.startAction(
        name: '_ProductModelBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_ProductModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setQuantity(int quantity) {
    final _$actionInfo = _$_ProductModelBaseActionController.startAction(
        name: '_ProductModelBase.setQuantity');
    try {
      return super.setQuantity(quantity);
    } finally {
      _$_ProductModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPrice(double price) {
    final _$actionInfo = _$_ProductModelBaseActionController.startAction(
        name: '_ProductModelBase.setPrice');
    try {
      return super.setPrice(price);
    } finally {
      _$_ProductModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setImageUrl(String imageUrl) {
    final _$actionInfo = _$_ProductModelBaseActionController.startAction(
        name: '_ProductModelBase.setImageUrl');
    try {
      return super.setImageUrl(imageUrl);
    } finally {
      _$_ProductModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
quantity: ${quantity},
price: ${price},
imageUrl: ${imageUrl}
    ''';
  }
}
