import 'package:e_nosa/models/categoriesModel.dart';
import 'package:e_nosa/models/productModel.dart';
import 'package:e_nosa/services/homeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);
  List<CategoriesModel> get categoryModel => _categoryModel;
  List<CategoriesModel> _categoryModel = [];
  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];

  HomeViewModel() {
    getCategories();
    getBestSellingProduct();
  }
  getCategories() async {
    _loading.value = true;

    await HomeService().getCategories().then((value) {
      for (var i = 0; i < value.length; i++) {
        _categoryModel.add(
            CategoriesModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        print(_categoryModel.length);
        _loading.value = false;
        print(_productModel.length);
      }
      update();
    });
  }

  getBestSellingProduct() async {
    _loading.value = true;
    HomeService().getBestProduct().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(
            ProductModel.fromJson(value[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  int _navigationValue = 0;
  get navigationValue => _navigationValue;
  void changeSelectedValue(int selectedValue) {
    _navigationValue = selectedValue;
    update();
  }
}
