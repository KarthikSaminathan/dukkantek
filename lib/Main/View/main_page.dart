import 'package:dukkantek/Login/Modal/user_information.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final UserInformation info;
  MainPage({required this.info});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
      body: Center(child: Text('Hi ${info.firstName} ${info.lastName}')),
    );
  }
}
