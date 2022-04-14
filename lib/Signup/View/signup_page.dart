import 'package:dukkantek/Resources/my_button.dart';
import 'package:dukkantek/Resources/my_textfield.dart';
import 'package:dukkantek/Signup/Controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final SignupController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN UP'),
      ),
      body: Container(
          color: Colors.white,
          child: Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _textfield(MyTextFieldType.firstName),
                    const SizedBox(
                      height: 20,
                    ),
                    _textfield(MyTextFieldType.lastName),
                    const SizedBox(
                      height: 20,
                    ),
                    _textfield(MyTextFieldType.email),
                    const SizedBox(
                      height: 20,
                    ),
                    _textfield(MyTextFieldType.phone),
                    const SizedBox(
                      height: 20,
                    ),
                    _textfield(MyTextFieldType.password),
                    const SizedBox(
                      height: 20,
                    ),
                    _textfield(MyTextFieldType.confirmp),
                    const SizedBox(
                      height: 20,
                    ),
                    _signupButton(context),
                  ]))),
    );
  }

  _textfield(MyTextFieldType type) {
    return MyTextField(
      keyboardtype: type,
      onchanged: (text) {
        print(text);
        controller.updateValue(type, text);
      },
    );
  }

  _signupButton(BuildContext context) {
    return MyButton(
      buttonName: 'Signup',
      width: 150,
      onPressed: () {
        FocusScope.of(context).unfocus();
        if (_formKey.currentState!.validate()) {
          controller.signupApiHit().then((isSuccess) {
            if (isSuccess) {
              Get.back();
            } else {
              print('something wrong');
            }
          });
        } else {
          print('validation failed');
        }
      },
    );
  }
}
