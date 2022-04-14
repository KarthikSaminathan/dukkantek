import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dukkantek/Login/Modal/user_information.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseCall {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> signup(String firstName, String lastName, String emailId,
      String password, String gToken) {
    return FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailId, password: password)
        .then((value) {
      CollectionReference users = firestore.collection('users');
      return users.doc(value.user!.uid).set({
        'uid': value.user!.uid,
        'first_name': firstName,
        'last_name': lastName,
        'email_id': emailId,
        'password': password,
        'g_token': gToken
      }).then((value) {
        return true;
      }).catchError((error) {
        return false;
      });
    });
  }

  static Future<UserInformation?> login(String email, String password) async {
    String? uid = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      if (value.user != null) {
        return value.user!.uid;
      } else {
        return null;
      }
    });
    UserInformation? info = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.data() != null) {
          return UserInformation.fromJson(
              documentSnapshot.data() as Map<String, dynamic>);
        } else {
          return null;
        }
      } else {
        return null;
      }
    });
    return info;
  }

  static Future<UserInformation?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    String? uId = await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((usercred) {
      print(usercred);
      return usercred.user != null ? usercred.user!.uid : null;
    });

    if (uId != null) {
      UserInformation? info = await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          if (documentSnapshot.data() != null) {
            return UserInformation.fromJson(
                documentSnapshot.data() as Map<String, dynamic>);
          } else {
            return null;
          }
        } else {
          return null;
        }
      });
      return info;
    }
  }
}
