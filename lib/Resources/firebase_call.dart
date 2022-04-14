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
    try {
      String? uid = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          return value.user!.uid;
        } else {
          return null;
        }
      }).catchError((error) {
        return null;
      });
      if (uid != null) {
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
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<UserInformation?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((usercred) {
      return usercred;
    });
    if (userCredential.additionalUserInfo != null &&
        userCredential.additionalUserInfo!.profile != null) {
      return UserInformation(
          firstName: userCredential.additionalUserInfo!.profile!['name'],
          lastName: userCredential.additionalUserInfo!.profile!['family_name'],
          emailId: userCredential.additionalUserInfo!.profile!['email']);
    } else {
      return null;
    }
  }
}
