import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:flutter_tutorial_todo/api/services.dart';
import 'package:flutter_tutorial_todo/controller/login_controller.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:flutter_tutorial_todo/view/home_screen.dart';
import 'package:flutter_tutorial_todo/view/login_screen.dart';
import 'package:flutter_tutorial_todo/view/widget/boxcontainer_widget.dart';
import 'package:flutter_tutorial_todo/view/widget/textfield_widget.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: GlobalValues.baby_powder,
        bottomSheet: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(
                child: Text('Todo.',
                    style: TextStyle(
                        color: GlobalValues.middle_blue,
                        fontSize: 75,
                        fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: BoxContainer(child: _signUpWidget()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget? _signUpWidget() {
  final LoginController lc = Get.put(LoginController());
  final ApiController apic = Get.put(ApiController());
  GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();

  return Form(
    key: formKeySignUp,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFieldWidget(
            onchange: (value) => lc.email.value = value,
            validator: lc.validateInput,
            obsecured: false,
            hintText: 'E-mail',
            icon: Icons.email),
        TextFieldWidget(
            onchange: (value) => lc.uname.value = value,
            validator: lc.validateInput,
            obsecured: false,
            hintText: 'Username',
            icon: Icons.person),
        TextFieldWidget(
            onchange: (value) => lc.pass.value = value,
            validator: lc.validateInput,
            obsecured: true,
            hintText: 'Password',
            icon: Icons.lock),
        TextFieldWidget(
            onchange: (value) => lc.pass2.value = value,
            validator: lc.validateInput,
            obsecured: true,
            hintText: 'Confirm Password',
            icon: Icons.lock),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              if (formKeySignUp.currentState!.validate()) {
                if (await RemoteServices.createUser(
                    lc.uname.value, lc.email.value, lc.pass.value)) {
                  await apic.getUsersData();
                  Get.to(() => HomePage());
                }
              }
            },
            child: Text(
              'Sign Up',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: GlobalValues.middle_blue,
                  fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
                primary: GlobalValues.baby_powder,
                fixedSize: Size(150, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)))),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("already have account?",
                style: TextStyle(color: GlobalValues.baby_powder)),
            TextButton(
                onPressed: () => Get.to(() => LoginScreen()),
                child: Text(
                  'Login',
                  style: TextStyle(
                      color: GlobalValues.baby_powder,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ],
    ),
  );
}
