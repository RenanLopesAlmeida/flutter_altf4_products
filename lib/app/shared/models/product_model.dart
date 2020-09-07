import 'package:mobx/mobx.dart';
part 'product_model.g.dart';

class ProductModel = _ProductModelBase with _$ProductModel;

abstract class _ProductModelBase with Store {
  String id;

  @observable
  String name;

  @observable
  int quantity;

  @observable
  double price;

  @observable
  String imageUrl;

  _ProductModelBase(
      {this.id, this.name, this.quantity, this.price, this.imageUrl});

  @action
  setName(String name) => this.name = name;

  @action
  setQuantity(int quantity) => this.quantity = quantity;

  @action
  setPrice(double price) => this.price = double.parse(price.toStringAsFixed(2));

  @action
  setImageUrl(String imageUrl) => this.imageUrl = imageUrl;

  _ProductModelBase.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.quantity = json['quantity'];
    this.price = json['price'];
    this.imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['image_url'] = this.imageUrl;

    return data;
  }
}
