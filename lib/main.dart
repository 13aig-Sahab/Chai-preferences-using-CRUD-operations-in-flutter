import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/screens/router.dart';

import 'package:todo_list/model/user.dart';
import 'package:todo_list/services/auth.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return  StreamProvider<User>.value(
      value: AuthHelper().userId,
          child: MaterialApp( 
        home: Router(),
      ),
    );
  }
}