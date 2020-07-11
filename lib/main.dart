import 'package:mycolocs/screens/login/login.dart';
import 'package:mycolocs/screens/root/root.dart';
import 'package:mycolocs/states/currentUser.dart';
import 'package:mycolocs/utils/ourTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (context) => CurrentUser(),
      child: MaterialApp(
        title: 'Co-Colocations',
        theme: OurTheme().buildTheme(),

        home: OurRoot(),
      ),
    );
  }
}