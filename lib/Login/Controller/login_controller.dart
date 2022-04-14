import 'package:get/get.dart';

import '../../Resources/my_textfield.dart';

class LoginController extends GetxController {
  var emailId = 'karthik.sinfotech@gmail.com';
  var password = 'Karthik@123';

  updateValue(MyTextFieldType type, String? value) {
    if (type == MyTextFieldType.email) {
      emailId = value ?? '';
    } else {
      password = value ?? '';
    }
  }
}
