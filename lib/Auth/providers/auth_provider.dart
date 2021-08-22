import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_firebase_gsg/Auth/helpers/auth_helper.dart';
import 'package:first_firebase_gsg/Auth/helpers/firestore_helper.dart';
import 'package:first_firebase_gsg/Auth/models/register_request.dart';
import 'package:first_firebase_gsg/Auth/models/user_model.dart';
import 'package:first_firebase_gsg/chats/home_screen.dart';
import 'package:first_firebase_gsg/services/custom_dialoug.dart';
import 'package:first_firebase_gsg/services/routes_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TabController tabController;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  
  List<UserModel> allUsers = [];

  resetController() {
    emailController.clear();
    passwordController.clear();
  }

  signup() async {
    await AuthHelper.authHelper
        .signup(emailController.text, passwordController.text);
    await AuthHelper.authHelper.verifyEmail();
    await AuthHelper.authHelper.logout();
    tabController.animateTo(1);
    resetController();
  }

  signin() async {
    UserCredential userCredential = await AuthHelper.authHelper
        .signin(emailController.text, passwordController.text);
    FirestoreHelper.firestoreHelper.addUserToFireStore(
      RegisterRequest(
        id: userCredential.user.uid,
        email: emailController.text,
        password: passwordController.text,
        fName: fNameController.text,
        lName: lNameController.text,
        city: cityController.text,
        country: countryController.text,
      ),
    );
    bool isVerifiedEmail = AuthHelper.authHelper.checkEmailVerification();
    if (isVerifiedEmail) {
      RouteHelper.routeHelper.goToPageWithReplacement(HomeScreen.routeName);
    } else {
      CustomDialoug.customDialoug.showCustomDialog(
        'You have to verify your email, press ok to send another email',
        sendVerication,
      );
    }
    resetController();
  }

  sendVerication() {
    AuthHelper.authHelper.verifyEmail();
    AuthHelper.authHelper.logout();
  }

  resetPassword() async {
    AuthHelper.authHelper.resetPassword(emailController.text);
    resetController();
  }

  getCurrentUser() {
    User user = AuthHelper.authHelper.getCurrentUser();
    return user;
  }

  getUserFromFirestore(String userId) async {
    FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
  }

   getAllUsersFromFirestore() async {
    allUsers =
        await FirestoreHelper.firestoreHelper.getAllUsersFromFirestore();
    notifyListeners();
  }
}
