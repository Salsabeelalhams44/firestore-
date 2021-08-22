import 'package:first_firebase_gsg/Auth/providers/auth_provider.dart';
import 'package:first_firebase_gsg/Auth/ui/screens/auth_main_screen.dart';
import 'package:first_firebase_gsg/Auth/ui/screens/login_screen.dart';
import 'package:first_firebase_gsg/Auth/ui/screens/signup_screen.dart';
import 'package:first_firebase_gsg/Auth/ui/screens/reset_password_screen.dart';
import 'package:first_firebase_gsg/chats/home_screen.dart';
import 'package:first_firebase_gsg/services/routes_helper.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        routes: {
          LoginScreen.routeName: (ctx) => LoginScreen(),
          SignupScreen.routeName: (ctx) => SignupScreen(),
          ResetPasswordScreen.routeName: (ctx) => ResetPasswordScreen(),
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
        navigatorKey: RouteHelper.routeHelper.navKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: FirebaseConfiguration(),
      ),
    );
  }
}

class FirebaseConfiguration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: Firebase.initializeApp(),
      builder: (ctx, AsyncSnapshot<FirebaseApp> dataSnapshot) {
        if (dataSnapshot.hasError) {
          return Scaffold(
            backgroundColor: Colors.red,
            body: Center(
              child: Text(dataSnapshot.error.toString()),
            ),
          );
        }
        if (dataSnapshot.connectionState == ConnectionState.done) {
          if (Provider.of<AuthProvider>(context,listen: false).getCurrentUser() != null) {
            return HomeScreen();
          }
          else{
          return AuthMainScreen();

          }
        }
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
