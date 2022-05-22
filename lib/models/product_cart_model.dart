class ProductCartModel {
  String? name, price, image;
  int quantity = 0;
  ProductCartModel({this.name, this.price, this.image, required this.quantity});
  ProductCartModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    quantity = map["quantity"];
    price = map["price"];

    image = map["image"];
  }

  toJson() {
    return {'name': name, 'price': price, 'image': image, 'quantity': quantity};
  }
}
