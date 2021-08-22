import 'package:first_firebase_gsg/Auth/providers/auth_provider.dart';
import 'package:first_firebase_gsg/Auth/ui/screens/login_screen.dart';
import 'package:first_firebase_gsg/Auth/ui/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthMainScreen extends StatefulWidget {
  @override
  _AuthMainScreenState createState() => _AuthMainScreenState();
}

class _AuthMainScreenState extends State<AuthMainScreen>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    Provider.of<AuthProvider>(context, listen: false).tabController =
        TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main PAge'),
        bottom: TabBar(
          controller: Provider.of<AuthProvider>(context).tabController,
          tabs: [
            Tab(
              text: 'Register',
            ),
            Tab(
              text: 'Login',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: Provider.of<AuthProvider>(context).tabController,
        children: [
          SignupScreen(),
          LoginScreen(),
        ],
      ),
    );
  }
}
