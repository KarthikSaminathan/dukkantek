import 'package:dukkantek/Login/Modal/user_information.dart';
import 'package:dukkantek/Login/View/login_page.dart';
import 'package:dukkantek/Main/View/main_page.dart';
import 'package:dukkantek/Signup/View/signup_page.dart';
import 'package:get/get.dart';

class MyRoutes {
  static const loginPageRoute = "/login";
  static const signupPageRoute = "/signup";
  static const mainPageRoute = "/main";

  static list() {
    return [
      GetPage(
        name: loginPageRoute,
        page: () => LoginPage(),
      ),
      GetPage(
        name: signupPageRoute,
        page: () => SignupPage(),
      ),
      GetPage(
        name: mainPageRoute,
        page: () => MainPage(
          info: UserInformation(),
        ),
      )
    ];
  }
}
