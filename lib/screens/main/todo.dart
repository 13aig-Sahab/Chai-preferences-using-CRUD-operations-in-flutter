import 'package:flutter/material.dart';
import 'package:todo_list/services/auth.dart';

class Chai extends StatefulWidget {
  @override
  _ChaiState createState() => _ChaiState();
}

class _ChaiState extends State<Chai> {

  final AuthHelper _authHelper = AuthHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(
          'CRUD Dashbaord'
        ),
        backgroundColor: Colors.yellowAccent,
        actions: <Widget>[
          FlatButton(onPressed: ()async{
              await _authHelper.logOut();
          }, child: Text('Logout'))
        ],
      ),
      
    );
  }
}