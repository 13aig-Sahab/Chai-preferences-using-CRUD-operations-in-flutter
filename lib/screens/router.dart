import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/model/user.dart';
import 'package:todo_list/screens/auth/authenicate.dart';
import 'package:todo_list/screens/main/todo.dart';

class Router extends StatefulWidget {
  @override
  _RouterState createState() => _RouterState();
}

class _RouterState extends State<Router> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<User>(context);
    return Authenitcator();
    // if(user == null){
    //   print('Not Signed In');
    //   return Authenitcator();
    // }else{
    //   return Chai();
    // }
  }
}