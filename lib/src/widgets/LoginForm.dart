import 'dart:developer';
import 'package:bholderapp/src/contansts/colors.dart';
import 'package:flutter/material.dart';
import '../services/auth.dart' show FBaseAuth;

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String emailVal = '';
  String passwordVal = '';

  void setEmail(String email) {
    this.setState(() {
      this.emailVal = email;
    });
  }

  void setPassword(String pass) {
    this.setState(() {
      this.passwordVal = pass;
    });
  }

  Future<void> singInUser() async {
    final auth = FBaseAuth();
    final user = await auth.singIn(this.emailVal, this.passwordVal);
    if (user.uid is String) {
      Navigator.pushNamed(context, '/list-profiles');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25, right: 25),
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: setEmail,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              onChanged: setPassword,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: ColorsBholder.darkBlue,
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: ColorsBholder.yellow,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      singInUser();
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: ButtonTheme(
                minWidth: double.infinity,
                child: RaisedButton(
                  color: ColorsBholder.darkBlue,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: ColorsBholder.yellow,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
