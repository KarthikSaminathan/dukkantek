import 'package:dukkantek/Login/Controller/login_controller.dart';
import 'package:dukkantek/Main/View/main_page.dart';
import 'package:dukkantek/Resources/firebase_call.dart';
import 'package:dukkantek/Resources/my_button.dart';
import 'package:dukkantek/Resources/my_routes.dart';
import 'package:dukkantek/Resources/my_textfield.dart';
import 'package:dukkantek/Resources/my_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:load/load.dart';

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
                    _textfield(MyTextFieldType.email, controller.emailId),
                    const SizedBox(
                      height: 20,
                    ),
                    _textfield(MyTextFieldType.password, controller.password),
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

  _textfield(MyTextFieldType type, String value) {
    return MyTextField(
      keyboardtype: type,
      initialValue: value,
      onchanged: (text) {
        controller.updateValue(type, text);
      },
    );
  }

  _loginButton(BuildContext context) {
    return MyButton(
      buttonName: 'Login',
      width: 150,
      onPressed: () async {
        FocusScope.of(context).unfocus();
        if (_formKey.currentState!.validate()) {
          showLoadingDialog();
          FirebaseCall.login(
                  controller.emailId.toLowerCase(), controller.password)
              .then((user) {
            hideLoadingDialog();
            if (user != null) {
              Get.to(MainPage(
                info: user,
              ));
            } else {
              MyToast.showToast(
                  'Invalid credential or Something went wrong. Please try again later');
            }
          });
        } else {}
      },
    );
  }

  _googleLoginButton(BuildContext context) {
    return MyButton(
      buttonName: 'Google Login',
      width: 150,
      onPressed: () async {
        FocusScope.of(context).unfocus();
        FirebaseCall.signInWithGoogle().then((userinfo) {
          if (userinfo != null) {
            Get.to(MainPage(
              info: userinfo,
            ));
          } else {
            Get.toNamed(MyRoutes.signupPageRoute);
          }
        });
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
