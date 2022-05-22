import 'package:e_nosa/views/CustomsWidgets/custom_text.dart';
import 'package:e_nosa/views/constant.dart';
import 'package:e_nosa/views/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view_model/auth_view_model.dart';

class Register extends GetWidget<AuthViewModle> {
  Register({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.off(Login());
          },
          child: const Icon(
            Icons.arrow_back,
            color: primary_color,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 35, right: 20, left: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(
                  text: "Register",
                  color: primary_color,
                  fontSize: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Login());
                  },
                  child: const CustomText(
                    text: "Login",
                    color: secondery_color,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                const CustomText(
                  text: "Name",
                  color: Colors.black,
                ),
                TextFormField(
                  onSaved: (value) {
                    controller.name = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "khansagafer",
                      hintStyle: TextStyle(
                        color: secondery_color,
                      ),
                      fillColor: secondery_color),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "Email",
                  color: Colors.black,
                ),
                TextFormField(
                  onSaved: (value) {
                    controller.email = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("error");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "khansagafer@gmail.com",
                      hintStyle: TextStyle(
                        color: secondery_color,
                      ),
                      fillColor: secondery_color),
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: "password",
                  color: Colors.black,
                ),
                TextFormField(
                  onSaved: (value) {
                    controller.password = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      print("Error");
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      hintText: "**********",
                      hintStyle: TextStyle(
                        color: secondery_color,
                      ),
                      fillColor: secondery_color),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Login());
                  },
                  child: const CustomText(
                    text: "Already have an acounnt?",
                    alignment: Alignment.topRight,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: primary_color),
                  onPressed: () {
                    _formKey.currentState?.save();

                    if (_formKey.currentState!.validate()) {
                      controller.createWithEmailPassword();
                    }
                  },
                  child: const CustomText(
                    text: "SignIn",
                    color: secondery_color,
                    alignment: Alignment.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
