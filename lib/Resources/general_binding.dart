import 'package:dukkantek/Signup/Controller/signup_controller.dart';
import 'package:get/get.dart';
import '../Login/Controller/login_controller.dart';

class GeneralBindings implements Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<SignupController>(SignupController());
  }
}
