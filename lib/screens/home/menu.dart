import 'package:flutter/material.dart';
import 'package:mycolocs/maps/offresMaps.dart';
import 'package:mycolocs/screens/demandes/demandeScreen.dart';
import 'package:mycolocs/screens/demandes/listedemandes.dart';
import 'package:mycolocs/screens/login/login.dart';
import 'package:mycolocs/screens/offre/nvl_offre.dart';
import 'package:mycolocs/screens/root/root.dart';
import 'package:mycolocs/states/currentUser.dart';
import 'package:provider/provider.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(6),
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 25, bottom: 10),
                  width: 120,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/home.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  "Student-CoLoCo",
                  style: TextStyle(
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Icon(Icons.hotel),
          title: Text('Déposer une Offre'),
          dense: true,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddOffre()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Offres Disponibles'),
          dense: true,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => MyMApp()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.library_books),
          title: Text('Déposer une demande '),
          dense: true,
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Listdemandes()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.assignment_return),
          title: Text('Déconnexion'),
          dense: true,
          onTap: ()  async {

            CurrentUser _currentUser= Provider.of<CurrentUser>(context,listen:false);
            String _returnString = await _currentUser.signOut();
            if(_returnString =="success"){
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> OurRoot()
              ), (route) => false);
            }
          },
        ),
      ],
    ));
  }
}
