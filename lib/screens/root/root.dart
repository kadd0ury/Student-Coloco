import 'package:mycolocs/screens/home/home.dart';
import 'package:mycolocs/screens/login/login.dart';
import 'package:mycolocs/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


enum AuthStatus {notLoggedIn, loggedIn }
class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;
  @override
  void didChangeDependencies() async{
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    CurrentUser _currentUser = Provider.of<CurrentUser>(context,listen: false);
    String _returnString = await _currentUser.onStartUp();
    if(_returnString =="success"){
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {

      case AuthStatus.notLoggedIn:
        retVal = Login();
        break;
      case AuthStatus.loggedIn:
        retVal = HomeScreen();

        break;
      default:
    }
    return retVal;
  }
}