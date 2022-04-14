import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCall {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> signup(
      String firstName, String lastName, String emailId, String password) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return users.add({
      'first_name': firstName,
      'last_name': lastName,
      'email_id': emailId,
      'password': password
    }).then((value) {
      return true;
    }).catchError((error) {
      return false;
    });
  }
}
