import 'package:e_nosa/view_model/auth_view_model.dart';
import 'package:e_nosa/views/CustomsWidgets/custom_text.dart';
import 'package:e_nosa/views/constant.dart';
import 'package:e_nosa/views/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends GetWidget<AuthViewModle> {
  Login({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20, right: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: "Welcome",
                    color: primary_color,
                    fontSize: 30.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Register());
                    },
                    child: CustomText(
                      text: "signin",
                      color: secondery_color,
                      fontSize: 18.0,
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
                  const CustomText(
                    text: "forget password?",
                    alignment: Alignment.topRight,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState?.save();

                      if (_formKey.currentState!.validate()) {
                        controller.signWithEmailPassword();
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: primary_color),
                    child: const CustomText(
                      text: "Login",
                      color: secondery_color,
                      alignment: Alignment.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomText(
                text: "_Or_",
                color: Colors.black,
                alignment: Alignment.center,
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(primary: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Image(
                      image: AssetImage('assets/images/face1.png'),
                      height: 30,
                      width: 30,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CustomText(
                      text: "Sign with FaceBook",
                      color: secondery_color,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.signWithGoogle();
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/email.png'),
                        height: 30,
                        width: 30,
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      CustomText(
                        text: "Sign with Google",
                        color: secondery_color,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
