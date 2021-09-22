import 'package:flutter/material.dart';
import 'package:flutter_tutorial_todo/api/api_controller.dart';
import 'package:flutter_tutorial_todo/api/services.dart';
import 'package:flutter_tutorial_todo/controller/login_controller.dart';
import 'package:flutter_tutorial_todo/model/globals_model.dart';
import 'package:flutter_tutorial_todo/view/forgot_screen.dart';
import 'package:flutter_tutorial_todo/view/home_screen.dart';
import 'package:flutter_tutorial_todo/view/login_screen.dart';
import 'package:flutter_tutorial_todo/view/signup_screen.dart';
import 'package:flutter_tutorial_todo/view/widget/textfield_widget.dart';
import 'package:get/get.dart';

class BoxContainer extends StatelessWidget {
  final String? route;

  BoxContainer({
    this.route,
    Key? key,
  }) : super(key: key);
  final LoginController lc = Get.put(LoginController());
  //final ApiController apic = Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: GlobalValues.marigold.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 15,
                offset: Offset(0, -3))
          ],
          color: GlobalValues.marigold,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: route == 'login' ? _loginWidget() : _signUpWidget()),
    );
  }

  Widget? _loginWidget() {
    return Form(
      key: lc.formKey.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
              onchange: (value) => lc.uname.value = value,
              validator: lc.validateInput,
              obsecured: false,
              //controller: unameController,
              hintText: 'Username',
              icon: Icons.email),
          TextFieldWidget(
              onchange: (value) => lc.pass.value = value,
              validator: lc.validateInput,
              obsecured: true,
              //controller: passController,
              hintText: 'Password',
              icon: Icons.lock),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () => Get.to(() => ForgotPassScreen()),
                child: Text('Forgot Password ?',
                    style: TextStyle(color: GlobalValues.baby_powder))),
          ),
          ElevatedButton(
              onPressed: () {
                if (lc.formKey.value.currentState!.validate()) {
                  Get.to(() => HomePage());
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

  Widget? _signUpWidget() {
    return Form(
      key: lc.formKey.value,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFieldWidget(
              onchange: (value) => lc.email.value = value,
              validator: lc.validateInput,
              obsecured: false,
              //controller: emailController,
              hintText: 'E-mail',
              icon: Icons.email),
          TextFieldWidget(
              onchange: (value) => lc.uname.value = value,
              validator: lc.validateInput,
              obsecured: false,
              //controller: unameController,
              hintText: 'Username',
              icon: Icons.person),
          TextFieldWidget(
              onchange: (value) => lc.pass.value = value,
              validator: lc.validateInput,
              obsecured: true,
              //controller: passController,
              hintText: 'Password',
              icon: Icons.lock),
          TextFieldWidget(
              onchange: (value) => lc.pass2.value = value,
              validator: lc.validateInput,
              obsecured: true,
              //controller: passController,
              hintText: 'Confirm Password',
              icon: Icons.lock),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () async {
                // if (lc.formKey2.value.currentState!.validate()) {
                //   if (await RemoteServices.createUser(
                //       lc.uname.value, lc.email.value, lc.pass.value)) {
                //     lc.formKey.value = new GlobalKey();
                //     //apic.getData();
                //     Get.to(() => HomePage());
                //   }
                // }
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
}
