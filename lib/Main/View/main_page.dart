import 'package:dukkantek/Login/Modal/user_information.dart';
import 'package:dukkantek/Resources/my_toast.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final UserInformation info;
  MainPage({required this.info});
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1)).then(
      (value) {
        MyToast.showSuccessToast('Successfully logged in');
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: Center(child: Text('Hi ${info.firstName} ${info.lastName}')),
    );
  }
}
