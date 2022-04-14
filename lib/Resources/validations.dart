
import 'constants.dart';

class Validations {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return Constants.emailIdCannotBeEmpty;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(email)) {
      return Constants.enterValidEmailId;
    }
    return null;
  }

  static String? validateFirstName(String firstname) {
    if (firstname.isEmpty) {
      return Constants.firstnameCannotBeEmpty;
    } else if (firstname.length < 3) {
      return Constants.enterValidFirstname;
    } else if (!RegExp("^[a-zA-Z]").hasMatch(firstname)) {
      return Constants.enterValidFirstname;
    }
    return null;
  }

  static String? validateLastName(String lastname) {
    if (lastname.isEmpty) {
      return Constants.lastnameCannotBeEmpty;
    } else if (!RegExp("^[a-zA-Z]").hasMatch(lastname)) {
      return Constants.enterValidlastname;
    }

    return null;
  }

  static String? validateQuestion(String question) {
    if (question.isEmpty) {
      return Constants.questionCannotBeEmpty;
    } else if (!RegExp("^[a-zA-Z]").hasMatch(question)) {
      return Constants.enterQuestion;
    }
    return null;
  }

  static String? validatePassword(String password) {
    //  passwordvalue = password;
    if (password.isEmpty) {
      return Constants.passwordCannotBeEmpty;
    }
    // else if (!RegExp("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])")
    //     .hasMatch(password)) {
    //   return Constants.passwordShouldBeProper;
    // }
    return null;
  }

  static String? validatePhone(var phone) {
    if (phone.isEmpty) {
      return Constants.phoneCannotBeEmpty;
    }
    if (!RegExp(r"^(?:[+0]9)?[0-9]{10}$").hasMatch(phone)) {
      return Constants.phoneShouldProper;
    }
    return null;
  }

  static String? validatePhoneCode(String code) {
    if (code.isEmpty) {
      return Constants.phoneCodeCannotBeEmpty;
    }
    String phonecode = code.toString().replaceAll("+", "");
    if (!RegExp("^[0-9]").hasMatch(phonecode)) {
      return Constants.phoneCodeShouldProper;
    }
    return null;
  }

  static String? validateConfirmPassword(
      String confirmpassword, String password) {
    if (confirmpassword.isEmpty) {
      return Constants.confirmPasswordCannotBeEmpty;
    } else if (password != confirmpassword) {
      return Constants.confirmPasswordShouldBeProper;
    }
    return null;
  }

  static String? validateResetCode(String resetcode) {
    if (resetcode.isEmpty) {
      return Constants.codeCannotBeEmpty;
    } else if (resetcode.length != 4) {
      return Constants.enterValidcode;
    } else if (!RegExp(r'^(?:[+0]9)?[0-9]{4}$').hasMatch(resetcode)) {
      return Constants.enterValidcode;
    }
    return null;
  }

  static String removWhiteSpace(String value) {
    return value.replaceAll('\u200B', '');
  }
}
