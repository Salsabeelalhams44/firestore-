import 'package:first_firebase_gsg/Auth/providers/auth_provider.dart';
import 'package:first_firebase_gsg/Auth/ui/widgets/custom_textField.dart';
import 'package:first_firebase_gsg/ui/global_widgets/custom_button_global.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  static final String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CustomTextField(
                label: 'Email',
                textEditingController: provider.emailController,
              ),
              CustomTextField(
                label: 'Password',
                textEditingController: provider.passwordController,
              ),
              CustomTextField(
                label: 'First Name',
                textEditingController: provider.fNameController,
              ),
              CustomTextField(
                label: 'Last Name',
                textEditingController: provider.lNameController,
              ),
              CustomTextField(
                label: 'City',
                textEditingController: provider.cityController,
              ),
              CustomTextField(
                label: 'Country',
                textEditingController: provider.countryController,
              ),
              CustomButtonGlobal(
                function: provider.signup,
                lable: 'Register',
              ),
            ],
          ),
        );
      },
    );
  }
}
