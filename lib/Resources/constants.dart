//import 'package:flutter/material.dart';

class Constants {
  static var securelogin = 'Secure Sign in';
  static var securesignup = 'Secure Sign Up';
  static var logintext = 'Please enter your credentials to proceed';
  static var profile = 'My Profile';
  static var email = 'EMAIL ADDRESS';
  static var password = 'PASSWORD';
  static var oldpassword = 'OLD PASSWORD';
  static var newpassword = 'NEW PASSWORD';
  static var confirmpassword = 'CONFIRM PASSWORD';
  static var lep = 'Law \nEnforcement \nPersonnel';
  static var ectques = 'YES';
  static var ectques1 = 'NO';
  static var admin = 'Administrator';
  static var signup = "Don't have an account?";
  static var signup1 = 'Sign up';
  static var signin = 'Already have an account?';
  static var signin1 = 'Sign in';
  static var forgot = 'Forgot Password?';
  static var changpass = 'Change Password?';

  static var forgottext = 'Continue with your credentials?';
  static var firstname = 'ENTER FULL NAME';
  static var lastname = 'ENTER LAST NAME';
  static var phone = 'ENTER PHONE NUMBER';
  static var categoryname = 'ENTER CATEGORY NAME';
  static var order = 'ENTER ORDER NUMBER';
  static var securityQuestion = 'SECURITY QUESTIONS';
  static var securityQuestion1 = 'Security Questions';
  static var question1 = 'WHO IS YOUR BOSS?';
  static var question2 = 'WHO IS YOUR BEST FRIEND?';
  static var question3 = 'WHAT WAS YOUR FIRST CAR MODEL?';
  static var iHaveReadTermsAndConditions = 'I have read and accept the';
  static var termsAndConditions = 'Terms of Service';
  static var pleaseAcceptTermsAndConditions =
      'Please accept the terms of service to proceed...';
  static var pleasEnterMailAddress =
      "Please enter your email address to reset \n"
      "                    your password";
  static var newPassword = 'Please enter your email id to reset your';
  static var alreadyHaveCode = 'I already have a code';
  static var login = 'Sign In';
  static var loginWithFB = 'Login With Facebook';
  static var forgotPassword = 'Forgot Password';
  static var register = 'Create Account';
  static var entercode = 'ENTER CODE';
  static var sendcode = 'Submit';
  static var cancel = 'CANCEL';
  static var attempt = 'Attempt';
  static var resetpass = 'Reset Password';
  static var factorverify = 'Two Factor Verification';
  static var biometric = 'Biometric Enable';
  static var biometrictext = '''Do you want enable biometric to secure
                 authentication?''';
  static var note = '''Note:Two Factor Verification will be enabled 
      default if you disabled this feature.''';
  static var biometricbutton = 'Enable';
  static var factorcode = 'ENTER YOUR VERIFICATION CODE';
  static var verifyIdentity = 'Verify your Identity';
  static var verifyText = '''Use your finger print or face scanner 
          to verify your identity''';
  static var twoFactorAuth = '    Two Factor \nAuthentication';
  static var enterVerificationCode = 'ENTER YOUR VERIFICATION CODE';
  static var passwordShouldContain =
      'Password should contain 10-16 characters made up of:\nUppercase letters(A-Z),\nLowercase letters(a-z),\nNumbers(0-9),\nand special characters(!@#%^&*+)';
  static var changePassword = 'Change Password';
  static var emailIdCannotBeEmpty = 'Email Id cannot be empty';
  static var enterValidEmailId = 'Must be name@email.com ';
  static var firstnameCannotBeEmpty = 'Name cannot be empty';
  static var enterValidFirstname = 'Atleast 3 letters required ';
  static var lastnameCannotBeEmpty = 'Last Name cannot be empty';
  static var categorynameCannotBeEmpty = 'Category Name cannot be empty';
  static var enterValidcategoryname = 'Category Name Must have a letter ';
  static var enterValidlastname = 'Last Name Must have a letter ';
  static var enterQuestion = 'Fill all Question';
  static var questionCannotBeEmpty = 'Security Question cannot be empty';
  static var codeCannotBeEmpty = 'Reset Code cannot be empty';
  static var enterValidcode = '4 digit code required ';
  static var passwordCannotBeEmpty = 'Password cannot be empty';
  static var passwordShouldBeProper =
      'Password should contain 10-16\ncharacters made up of:\nUppercase letters(A-Z),\nLowercase letters(a-z),\nNumbers(0-9)';
  //,\nand special characters(!@#%^&*+).';
  static var confirmPasswordCannotBeEmpty = 'Password cannot be empty';
  static var confirmPasswordShouldBeProper =
      "Confirm password should be same as Password";
  static var somethingWentWrong =
      'Something went wrong. Please try again later';
  static var phoneCannotBeEmpty = 'Phone No. cannot be empty';
  static var phoneCodeCannotBeEmpty = 'Phone Code. cannot be empty';
  static var phoneCodeShouldProper = 'Please Enter Valid Phone Code';

  static var phoneShouldProper = 'Please Enter Valid Phone Number';
  static var orderCannotBeEmpty = 'Order No. cannot be empty';
  static var orderShouldProper = 'Order should a Number';
  static var report = 'Report';
  static var showmore = 'Show More';
  static var showless = 'Show Less';
  static var photos = 'PHOTOS';
  static var videos = 'VIDEOS';
  static var followers = 'Followers';
  static var following = 'Following';
  static var follow = 'Follow';
  static var unFollow = 'UnFollow';
  static var newsFeed = 'NEWS FEED';
  static var speak = 'Speak here';
  static var q1 = 'Is the computer powered on?';
  static var q2 =
      'Are law enforcement personnel with specific computer seizure training available?';
  static var q3 = 'Is the system a networked business environment?';
  static var q4 = 'Are destructive process running?';
  static var q5 = 'Is information of evidential value visible onscreen?';
  static var superAdmin = 'cfb super admin';
  static var countryAdmin = 'country admin';
  static var jurisdictionAdmin = 'jurisdiction admin';
  static var user = 'user';
}

class Drop {
  var dype;
  String name;
  final image;
  Drop(this.dype, this.image, this.name);
}

List<Map> getDrops = [
  {'name': 'USA', 'image': 'assets/united-states-emoji.png', 'jur': 'NYPD'},
  {'name': 'CANADA', 'image': 'assets/canada-emoji.png', 'jur': 'RCMP'},
  {
    'name': 'European Union',
    'image': 'assets/european-union-emoji.png',
    'jur': 'Gendarmerie Nationale'
  },
  {
    'name': 'FRANCE',
    'image': 'assets/france-emoji.png',
    'jur': 'None at this time'
  }
];
List<Map> getCL = [
  {'name': 'USA', 'image': 'assets/united-states-emoji.png'},
  {'name': 'CANADA', 'image': 'assets/canada-emoji.png'},
  {'name': 'European Union', 'image': 'assets/european-union-emoji.png'},
  {'name': 'FRANCE', 'image': 'assets/france-emoji.png'}
];

class Juris {
  final String type;
  const Juris(this.type);
}

const List<Juris> getJuris = <Juris>[
  Juris('NYPD'),
  Juris('RCMP'),
  Juris('Gendarmerie Nationale'),
  Juris('None at this time')
];

class AdminType {
  final String type;
  const AdminType(this.type);
}

const List<AdminType> getadmin = <AdminType>[
  AdminType('Super Admin'),
  AdminType('Country Admin'),
  AdminType('Jurisdiction Admin'),
  AdminType('User'),
];

class CategoryType {
  final String type;
  const CategoryType(this.type);
}

const List<CategoryType> getcategory = <CategoryType>[
  CategoryType('Static'),
  CategoryType('Subcategory'),
  CategoryType('Question'),
  CategoryType('Flowchart'),
];
const List<CategoryType> getStaticcategory = <CategoryType>[
  CategoryType('Static'),
  CategoryType('Question'),
  CategoryType('Flowchart')
];

class SubCategoryType {
  final String type;
  const SubCategoryType(this.type);
}

const List<SubCategoryType> getflowcategory = <SubCategoryType>[
  SubCategoryType('Subcategory'),
  SubCategoryType('Questions'),
  SubCategoryType('Flowchart')
];

class CODE {
  final String type;
  const CODE(this.type);
}

const List<CODE> code = <CODE>[
  CODE('Federal Criminal Code'),
  CODE('Regulatory Schemes'),
  CODE('Civil Codes and Federal Regulatory Schemes')
];

String currentTimeStamp() {
  return '${DateTime.now().millisecond}';
}
