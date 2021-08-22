import 'package:first_firebase_gsg/services/routes_helper.dart';
import 'package:flutter/material.dart';

class CustomDialoug {
  CustomDialoug._();
  static CustomDialoug customDialoug = CustomDialoug._();

  showCustomDialog(String message, [Function function]) {
    showDialog(
        context: RouteHelper.routeHelper.navKey.currentContext,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  if (function == null) {
                    RouteHelper.routeHelper.back();
                  } else {
                    function();
                    RouteHelper.routeHelper.back();
                  }
                },
                child: Text('ok'),
              )
            ],
          );
        });
  }
}
