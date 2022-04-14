import 'package:dukkantek/Resources/general_binding.dart';
import 'package:dukkantek/Resources/my_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'Resources/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DukkantekApp());
}

class DukkantekApp extends StatelessWidget {
  const DukkantekApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DUKKANTEK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyRoutes.loginPageRoute,
      getPages: MyRoutes.list(),
      initialBinding: GeneralBindings(),
    );
  }
}
