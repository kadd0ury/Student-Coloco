import 'package:mycolocs/screens/login/login.dart';
import 'package:mycolocs/screens/singup/singup.dart';
import 'package:mycolocs/states/currentUser.dart';
import 'package:mycolocs/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurSignUpForm extends StatefulWidget {
  @override
  _OurSignUpFormState createState() => _OurSignUpFormState();
}

class _OurSignUpFormState extends State<OurSignUpForm> {
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context,
      String fullname, String phonenumber) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =
          await _currentUser.signUpUser(email, password, fullname, phonenumber);
      if (_returnString == "success") {
        Navigator.pop(context);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_returnString),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
            child: Text("S'incrire",
                style: TextStyle(
                  color:Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
          TextFormField(
            controller: _fullNameController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person_outline), hintText: "Name"),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _mobileNumberController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: "Phone"),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _emailNumberController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.dashboard), hintText: "Email"),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.security), hintText: "Password"),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _confirmPasswordController,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.security),
                hintText: "Confirme Password"),
            obscureText: true,
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "S'inscrire",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            onPressed: () {
              if (_passwordController.text == _confirmPasswordController.text) {
                _signUpUser(
                    _emailNumberController.text,
                    _passwordController.text,
                    context,
                    _fullNameController.text,
                    _mobileNumberController.text);
              } else {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Password do not match"),
                  duration: Duration(seconds: 2),
                ));
              }
            },
          ),
          FlatButton(
            child: Text("Vous n'avez pas de compte ? Inscrivez-vous"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OurSignUp(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
