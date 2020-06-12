import 'package:bholderapp/src/widgets/LoginForm.dart';
import 'package:bholderapp/src/widgets/Logo.dart';
import 'package:flutter/material.dart';
import '../contansts/colors.dart' show ColorsBholder;

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsBholder.blue,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[Logo(), LoginForm()],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ));
  }
}
