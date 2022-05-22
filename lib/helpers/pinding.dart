import 'package:e_nosa/view_model/auth_view_model.dart';
import 'package:e_nosa/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModle());
    Get.lazyPut(() => HomeViewModel());
  }
}
