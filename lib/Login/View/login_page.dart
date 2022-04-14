import 'package:dukkantek/Login/Controller/login_controller.dart';
import 'package:dukkantek/Main/View/main_page.dart';
import 'package:dukkantek/Resources/my_button.dart';
import 'package:dukkantek/Resources/my_routes.dart';
import 'package:dukkantek/Resources/my_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textfield(MyTextFieldType.email),
                    const SizedBox(
                      height: 20,
                    ),
                    _textfield(MyTextFieldType.password),
                    const SizedBox(
                      height: 20,
                    ),
                    _loginButton(context),
                    const SizedBox(
                      height: 20,
                    ),
                    _googleLoginButton(context),
                    const SizedBox(
                      height: 15,
                    ),
                    _signupButton(context)
                  ]))),
    );
  }

  _textfield(MyTextFieldType type) {
    return MyTextField(
      keyboardtype: type,
      onchanged: (text) {
        controller.updateValue(type, text);
      },
    );
  }

  _loginButton(BuildContext context) {
    return MyButton(
      buttonName: 'Login',
      width: 150,
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (_formKey.currentState!.validate()) {
          Get.to(MainPage());
        } else {
          print('validation failed');
        }
      },
    );
  }

  _googleLoginButton(BuildContext context) {
    return MyButton(
      buttonName: 'Google Login',
      width: 150,
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (_formKey.currentState!.validate()) {
          Get.to(MainPage());
        } else {
          print('validation failed');
        }
      },
    );
  }

  _signupButton(BuildContext context) {
    return MyButton(
      buttonName: 'Signup',
      width: 150,
      type: ButtonType.normalWithoutBg,
      onPressed: () {
        FocusScope.of(context).unfocus();
        Get.toNamed(MyRoutes.signupPageRoute);
      },
    );
  }
}
