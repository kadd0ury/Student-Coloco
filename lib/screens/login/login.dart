import 'package:flutter/material.dart';
import 'local_widgets/loginForm.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(70.0),
                  child: Image.asset("assets/home.png"),
                ),
                SizedBox(
                  height: 1.0,
                ),
                OurLoginForm(),

              ],
            ),
          )
        ],
      ),
    );
  }
}