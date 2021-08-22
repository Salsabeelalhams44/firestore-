import 'package:flutter/material.dart';

class CustomButtonGlobal extends StatelessWidget {
  Function function;
  String lable;

  CustomButtonGlobal({this.lable, this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.greenAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onPressed: function,
        child: Text(
          lable,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
