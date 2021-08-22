import 'package:first_firebase_gsg/Auth/providers/auth_provider.dart';
import 'package:first_firebase_gsg/Auth/ui/screens/reset_password_screen.dart';
import 'package:first_firebase_gsg/services/routes_helper.dart';
import 'package:first_firebase_gsg/ui/global_widgets/custom_button_global.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_textField.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static final String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomTextField(
              label: 'Email',
              textEditingController: provider.emailController,
            ),
            CustomTextField(
              label: 'Password',
              textEditingController: provider.passwordController,
            ),
            CustomButtonGlobal(
              function: provider.signin,
              lable: 'Login',
            ),
            GestureDetector(
              onTap: (){
                RouteHelper.routeHelper.goToPage(ResetPasswordScreen.routeName);
              } ,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Forget Password?',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
