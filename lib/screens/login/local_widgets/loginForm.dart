import 'package:mycolocs/screens/home/home.dart';
import 'package:mycolocs/screens/singup/singup.dart';
import 'package:mycolocs/states/currentUser.dart';
import 'package:mycolocs/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurLoginForm extends StatefulWidget {
  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  void _loginUser(String email, String password , BuildContext context) async{
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try{
      String _returnString = await _currentUser.loginUser(email, password);
      if(_returnString== "success"){
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context)=> HomeScreen(),
          ),
        );
      } else{
        Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(_returnString),
              duration: Duration(seconds: 2),
            )
        );

      }
    }
    catch(e){

    }
  }
  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child : Column(
        children : <Widget>[
          Padding(padding: EdgeInsets.symmetric(vertical :20.0 ,horizontal:8.0),
            child: Text(
                "Connexion",
                style : TextStyle(

                  color : Colors.black,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                )
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration : InputDecoration(prefixIcon : Icon(Icons.dashboard), hintText:"Email"),
          ),
          SizedBox(height : 20.0),
          TextFormField(
            controller: _passwordController,
            decoration : InputDecoration(prefixIcon : Icon(Icons.security), hintText:"Password"),
            obscureText: true,
          ),
          SizedBox(height : 20.0),
          RaisedButton(color: Colors.black,child: Padding(padding: EdgeInsets.symmetric(horizontal : 100 ),

            child : Text("Se connecter" ,
              style: TextStyle(
                color : Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),),
          ),
            onPressed: (){
              _loginUser(_emailController.text , _passwordController.text, context);
            },
          ),
          FlatButton(
            child : Text("Vous n'avez pas de compte ? Inscrivez-vous"),
            materialTapTargetSize:  MaterialTapTargetSize.shrinkWrap,
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> OurSignUp(),
                ),
              );
            },)

        ],
      ),
    );


  }
}