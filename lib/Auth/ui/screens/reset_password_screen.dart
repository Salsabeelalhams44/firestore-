import 'package:first_firebase_gsg/Auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:first_firebase_gsg/Auth/ui/widgets/custom_textField.dart';
import 'package:first_firebase_gsg/ui/global_widgets/custom_button_global.dart';

class ResetPasswordScreen extends StatelessWidget {
  static final String routeName = '/reset-password';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Consumer<AuthProvider>(
        builder: (context, provider, x) {
          return Column(
            children: <Widget>[
              CustomTextField(
                label: 'Email',
                textEditingController: provider.emailController,
              ),
              CustomButtonGlobal(
                function: provider.resetPassword,
                lable: 'Reset Pssword',
              ),
            ],
          );
        },
      ),
    );
  }
}
