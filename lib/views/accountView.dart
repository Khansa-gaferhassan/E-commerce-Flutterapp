import 'package:e_nosa/views/screens/cardView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../view_model/home_view_model.dart';
import 'home_view.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buttomNavigationBar(),
    );
  }
}

Widget buttomNavigationBar() {
  return GetBuilder<HomeViewModel>(
    init: HomeViewModel(),
    builder: (controller) => BottomNavigationBar(
        elevation: 0,
        currentIndex: controller.navigationValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
          switch (index) {
            case 0:
              {
                Get.to(HomeView());
                break;
              }
            case 1:
              {
                Get.to(AccountView());
                break;
              }
            case 2:
              {
                Get.to(CardView());
              }
          }
        },
        items: [
          BottomNavigationBarItem(
              label: "Explore",
              icon: Image.asset(
                "assets/images/back-arrow.png",
                height: 30,
                width: 30,
              )),
          BottomNavigationBarItem(
              label: "account",
              icon: Image.asset(
                "assets/images/person.png",
                height: 30,
                width: 30,
                fit: BoxFit.contain,
              )),
          BottomNavigationBarItem(
              label: "shopping",
              icon: Image.asset(
                "assets/images/shopping-cart.png",
                height: 30,
                width: 30,
              ))
        ]),
  );
}
