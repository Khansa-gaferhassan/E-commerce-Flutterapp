import 'package:e_nosa/models/productModel.dart';
import 'package:e_nosa/views/CustomsWidgets/custom_text.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

class Details extends StatelessWidget {
  ProductModel? model;

  Details({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              // height: 250,
              child: Image.network(
                model!.image as String,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      CustomText(
                        text: model!.name,
                        fontSize: 30.0,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width * .38,
                            decoration: BoxDecoration(
                                // color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: "Size"),
                                CustomText(
                                  text: model!.size,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            width: MediaQuery.of(context).size.width * .38,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(text: "color"),
                                Container(
                                    width: 40,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20),
                                      color: model!.color,
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "Details",
                        color: secondery_color,
                        fontSize: 28.0,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        lineHeight: 2.0,
                        text: model!.description,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "PRICE",
                        color: secondery_color,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: " \$ " + model!.price!,
                      )
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.all(20),
                      width: 150,
                      height: 100,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: primary_color),
                        onPressed: () {},
                        child: CustomText(
                          text: "ADD",
                          color: secondery_color,
                          alignment: Alignment.center,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
