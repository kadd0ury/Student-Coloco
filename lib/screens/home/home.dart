import 'package:mycolocs/screens/root/root.dart';
import 'package:mycolocs/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Acceuil"),
    ),
      drawer: Menu(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 14, 0, 10),
                decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(3.0, 3.0),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ),
                    ]
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/home.png'),
                  radius: 70.0,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stduent-CoLoCo est une application Mobile qui permet aux étudiants externes de la faculté Benni-Mellal de trouver facilement un logement pour allouer ,à travers une centaine des offres et demandes de Co-locations."

                          ,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "Vous allez trouver toutes les informations concenant les détails de chaque offre et demandes pour les logement,ainsi les numéros de contact des personnes."

                      ,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}