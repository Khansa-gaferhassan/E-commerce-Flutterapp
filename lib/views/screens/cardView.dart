import 'package:e_nosa/views/CustomsWidgets/custom_text.dart';
import 'package:e_nosa/views/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../view_model/home_view_model.dart';
import '../accountView.dart';
import '../home_view.dart';

class CardView extends StatelessWidget {
  CardView({Key? key}) : super(key: key);
  List<String> names = <String>[
    "women bag",
    "women bag",
    "women bag",
    "women bag",
    "women bag",
  ];
  List<String> images = <String>[
    "assets/images/pag.jpg",
    "assets/images/pag.jpg",
    "assets/images/pag.jpg",
    "assets/images/pag.jpg",
    "assets/images/pag.jpg",
  ];

  List<int> prices = <int>[122, 44, 56, 78, 89];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: names.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                          width: 140,
                          child: Image.asset(
                            images[index],
                            fit: BoxFit.fill,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, top: 10),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomText(
                              text: names[index],
                              fontSize: 24.0,
                              color: secondery_color,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomText(
                              text: "\$ " + prices[index].toString(),
                            ),
                            Container(
                              width: 150,
                              color: Colors.grey.shade200,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ),
                                  CustomText(
                                    text: "1",
                                    color: Colors.black,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 7),
                                    child: Icon(
                                      Icons.minimize,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: "TOTAL",
                      color: secondery_color,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CustomText(
                      text: "total Price",
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  width: 130,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: primary_color),
                    onPressed: () {},
                    child: CustomText(
                      text: "Check Out",
                      color: secondery_color,
                      alignment: Alignment.center,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
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
