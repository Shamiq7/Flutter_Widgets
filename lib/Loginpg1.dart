import 'package:flutter/material.dart';
import 'package:flutter_widgets/functions/authfunctions.dart';
import 'package:flutter_widgets/widget3.dart';

class Loginpg1 extends StatefulWidget {
  const Loginpg1({super.key});

  @override
  State<Loginpg1> createState() => _Loginpg1State();
}

class _Loginpg1State extends State<Loginpg1> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String mail = '';
  String password = '';
  String userName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loginn Pg'), centerTitle: true),
      body: Form(
        key: _formkey,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      !isLogin
                          ? TextFormField(
                              key: ValueKey('Name'),
                              decoration: InputDecoration(
                                label: Text('Enter your Name'),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Name';
                                }
                                if (value.length < 2) {
                                  return 'Please Enter valid Name';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                userName = newValue!;
                              },
                            )
                          : Container(),
                      SizedBox(height: 10),
                      TextFormField(
                        key: ValueKey('Mail'),
                        decoration: InputDecoration(
                          label: Text('Enter your Mail'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !(value.toString().contains('@'))) {
                            return 'Please enter your Mail with @';
                          }
                          if (value.length < 3 ||
                              !(value.toString().contains('@'))) {
                            return 'Please Enter valid mail with @';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          mail = newValue!;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        key: ValueKey('Password'),
                        decoration: InputDecoration(
                          label: Text('Enter your Passsowrd'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your Password';
                          }
                          if (value.length < 6) {
                            return 'Please Enter valid Password';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          password = newValue!;
                        },
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              Container(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      signup(mail, password);
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => Widget3()),
                      // );
                    }
                  },
                  child: !isLogin
                      ? Text('Sign up', style: TextStyle(color: Colors.white))
                      : Text('Login', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLogin = !isLogin;
                  });
                },
                child: !isLogin
                    ? Text('Dont have an account? Login')
                    : Text(
                        'Already Singed up? Login',
                        // style: TextStyle(color: Colors.purple),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
