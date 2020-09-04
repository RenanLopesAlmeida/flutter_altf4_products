class ProductModel {
  String id;
  String name;
  int quantity;
  int price;

  ProductModel({this.id, this.name, this.quantity, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    this.id = json['id'];
    this.name = json['name'];
    this.quantity = json['quantity'];
    this.price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;

    return data;
  }
}
