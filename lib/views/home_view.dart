import 'package:e_nosa/view_model/home_view_model.dart';
import 'package:e_nosa/views/CustomsWidgets/custom_text.dart';
import 'package:e_nosa/views/accountView.dart';
import 'package:e_nosa/views/constant.dart';
import 'package:e_nosa/views/details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final List<String> names = <String>[
    "kh",
    "kh",
    "kh",
    "kh",
    "kh",
  ];
  @override
  Widget build(BuildContext context) {
    // final AuthViewModle cAuth = Get.put(AuthViewModle());
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Categories",
                        fontSize: 20.0,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewCategory(),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18.0,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16.0,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: buttomNavigationBar(),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.network(
                        controller.categoryModel[index].image as String),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(text: controller.categoryModel[index].name),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  // var heart = Emoji( '❤️');

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(Details(
                  model: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                              controller.productModel[index].image as String)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.productModel[index].description,
                        color: Colors.grey,
                        alignment: Alignment.bottomLeft,
                        maxLine: 1,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.productModel[index].price.toString() +
                          " \$",
                      color: primary_color,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
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
                  Get.to(Card());
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
}
