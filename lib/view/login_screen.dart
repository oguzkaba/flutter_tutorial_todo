import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:flutter_tutorial_todo/controller/login_controller.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:flutter_tutorial_todo/view/createnick_screen.dart';
import 'package:flutter_tutorial_todo/view/forgot_screen.dart';
import 'package:flutter_tutorial_todo/view/signup_screen.dart';
import 'package:flutter_tutorial_todo/view/widget/boxcontainer_widget.dart';
import 'package:flutter_tutorial_todo/view/widget/textfield_widget.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: GlobalValues.baby_powder,
        bottomSheet: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    child: Center(
                  child: Text('Todo.',
                      style: TextStyle(
                          color: GlobalValues.middle_blue,
                          fontSize: 75,
                          fontWeight: FontWeight.bold)),
                )),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: BoxContainer(child: _loginWidget()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget? _loginWidget() {
  final LoginController lc = Get.put(LoginController());
  final ApiController apic = Get.put(ApiController());
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();
  return Form(
    key: formKeyLogin,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextFieldWidget(
            onchange: (value) => lc.uname.value = value,
            validator: lc.validateInput,
            obsecured: false,
            hintText: 'Username',
            icon: Icons.email),
        TextFieldWidget(
            onchange: (value) => lc.pass.value = value,
            validator: lc.validateInput,
            obsecured: true,
            hintText: 'Password',
            icon: Icons.lock,
            icon2: Icons.visibility_off),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () => Get.to(() => ForgotPassScreen()),
              child: Text('Forgot Password ?',
                  style: TextStyle(color: GlobalValues.baby_powder))),
        ),
        ElevatedButton(
            onPressed: () async {
              if (formKeyLogin.currentState!.validate()) {
                await apic.getUsersData();
                //await apic.getTodosData(10, 0);
                Get.to(() => CreateNick());
              }
            },
            child: Text(
              'Login',
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
            Text("don't have account?",
                style: TextStyle(color: GlobalValues.baby_powder)),
            TextButton(
                onPressed: () => Get.to(() => SignUpScreen()),
                child: Text(
                  'SIGN UP',
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
