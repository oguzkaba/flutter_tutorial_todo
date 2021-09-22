import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:flutter_tutorial_todo/view/login_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Ekran yonunu ayarla
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins"),
      home: LoginScreen(),
    );
  }
}
