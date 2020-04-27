import 'package:flutter/material.dart';
import 'package:todo_list/screens/auth/LoginIn.dart';
import 'package:todo_list/screens/auth/Register.dart';

class Authenitcator extends StatefulWidget {
  @override
  _AuthenitcatorState createState() => _AuthenitcatorState();
}

class _AuthenitcatorState extends State<Authenitcator> {

  bool showSignIn = true;

  void toggleScreen() {
    setState(() {
      showSignIn = !showSignIn;
        });
  }
  @override
  Widget build(BuildContext context) {
   if(showSignIn) {
        return  LogIn(toggleScreen: toggleScreen);
      }else{
        return Register(toggleScreen : toggleScreen);
      }
  }
}