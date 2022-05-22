class CategoriesModel {
  String? name, image;
  CategoriesModel({this.name, this.image});
  CategoriesModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    name = map["name"];
    image = map["image"];
  }
  toJson() {
    return {
      "name": name,
      "image": image,
    };
  }
}
