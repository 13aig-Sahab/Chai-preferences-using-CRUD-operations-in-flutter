import 'package:flutter/material.dart';
import 'package:todo_list/services/auth.dart';

class LogIn extends StatefulWidget {
  final Function toggleScreen;

  LogIn({this.toggleScreen});
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

   final AuthHelper _authHelper = AuthHelper();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    print('Screen Login');
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Register Screen'
          ),
          backgroundColor: Colors.yellowAccent,
        ),
        body: Container(
          child: Center(
            child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(Icons.email, color: Colors.yellowAccent),
                      ),
                      validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                      onChanged: (val){
                        setState(() {
                          email = val;
                        });
                      },
                  ),
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.lock,color:Colors.yellowAccent)
                    ),
                    validator: (val) => val.length < 8 ? 'Password Should Be 8 Character' : null,
                    onChanged: (val){
                      setState(() {
                        password = val;
                      });
                    },
                    obscureText: true,
                  ),SizedBox(height:20.0),
                  RaisedButton.icon(onPressed: ()async{
                      if(_formkey.currentState.validate()){
                        dynamic result = await _authHelper.logIn(email, password);
                        if(result == null){
                          error = result.toString(1);
                        }
                      }
                  }, 
                  icon: Icon(Icons.person_add,color:Colors.white) ,
                  label: Text('Register')),
                  SizedBox(height:20.0),
                  Text(error),
                  SizedBox(height:20.0),
                  RaisedButton.icon(onPressed: (){
                      widget.toggleScreen();
                  }, icon: Icon(Icons.person,color: Colors.white,), label: Text('Login'))
                ],
              ),
            ),
          ),
        ),
    );
  }
}