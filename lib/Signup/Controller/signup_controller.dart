import 'package:dukkantek/Resources/firebase_call.dart';
import 'package:get/get.dart';
import '../../Resources/my_textfield.dart';

class SignupController extends GetxController {
  var firstName = '';
  var lastName = '';
  var emailId = '';
  var password = '';
  var phoneNo = '';
  var gToken = '';

  updateValue(MyTextFieldType type, String? value) {
    print(type);
    if (type == MyTextFieldType.firstName) {
      firstName = value ?? '';
    } else if (type == MyTextFieldType.lastName) {
      lastName = value ?? '';
    } else if (type == MyTextFieldType.email) {
      emailId = value ?? '';
    } else if (type == MyTextFieldType.phone) {
      phoneNo = value ?? '';
    } else {
      password = value ?? '';
    }
  }

  Future<bool> signupApiHit() async {
    return FirebaseCall.signup(firstName, lastName, emailId, password, gToken)
        .then((isSuccess) {
      return isSuccess;
    });
  }
}
