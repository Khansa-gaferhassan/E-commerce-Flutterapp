import 'package:e_nosa/helpers/extension.dart';
import 'package:flutter/cupertino.dart';

class ProductModel {
  String? name, description, price, size, image;
  Color? color;
  ProductModel(
      {this.name,
      this.description,
      this.price,
      this.size,
      this.image,
      this.color});
  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    description = map["description"];
    price = map["price"];
    size = map["size"];
    image = map["image"];
    color = HexColor.fromHex(map["color"]);
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'size': size,
      'image': image,
      'color': color,
    };
  }
}
