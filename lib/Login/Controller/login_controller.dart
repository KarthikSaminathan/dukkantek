import 'package:get/get.dart';

import '../../Resources/my_textfield.dart';

class LoginController extends GetxController {
  var emailId = '';
  var password = '';

  updateValue(MyTextFieldType type, String? value) {
    if (type == MyTextFieldType.email) {
      emailId = value ?? '';
    } else {
      password = value ?? '';
    }
  }
}
