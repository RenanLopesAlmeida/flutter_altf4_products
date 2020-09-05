class ProductModel {
  String id;
  String name;
  int quantity;
  double price;
  String imageUrl;

  ProductModel({this.id, this.name, this.quantity, this.price, this.imageUrl});

  ProductModel.fromJson(Map<String, dynamic> json) {
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
