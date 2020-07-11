import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mycolocs/services/database.dart';
import 'package:mycolocs/models/offre.dart';

class AddOffre extends StatefulWidget {
  @override
  @override
  final double x;
  final double y;

  const AddOffre ({ Key key, this.x,this.y }): super(key: key);
  _AddOffreState createState() => _AddOffreState();
}

class _AddOffreState extends State<AddOffre> {
  String dropdownValue_capacite = '1';
  bool terrasse = false;
  bool wifi = false;
  bool laveLinge = false;

  List<bool> suppls;


  TextEditingController _teleController = TextEditingController();
  TextEditingController _latController = TextEditingController();
  TextEditingController _longController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  TextEditingController _superficieController = TextEditingController();

  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  @override
  Widget build(BuildContext context) {

    double x = widget.x;
    _latController.text= x.toString();
    double y = widget.y;
    _longController.text= y.toString();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        title: Text(
          'Nouvelle Offre ',
          style: TextStyle(
              fontFamily: 'poppins-regular', fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        children: <Widget>[
          AddNvlOffre(),
        ],
      ),
    );
  }

  Widget AddNvlOffre() {
    return new Container(
      height: 800,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: new ListView(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "Latitude : ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Quicksand'),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.teal, width: 0.5, style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(

                    controller: _latController,
                    enabled: false,
                    style: TextStyle(color: Colors.teal),
                    cursorColor: Colors.teal,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'latitude',
                      hintStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Quicksand'),
                    ),
                    onChanged: (String str) {
                      setState(() {
                        //_data.name = str;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "Longtitude",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Quicksand'),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.teal, width: 0.5, style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    enabled: false,
                    controller: _longController,
                    style: TextStyle(color: Colors.teal),
                    cursorColor: Colors.teal,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'longtitude',
                      hintStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Quicksand'),
                    ),
                    onChanged: (String str) {
                      setState(() {
                        //_data.name = str;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "Superficie",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Quicksand'),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.black, width: 0.5, style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    controller: _superficieController,
                    style: TextStyle(color: Colors.teal),
                    cursorColor: Colors.teal,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Superficie(m2)',
                      hintStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Quicksand'),
                    ),
                    onChanged: (String str) {
                      setState(() {
                        //_data.name = str;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),

          //start

          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "Téléphone",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Quicksand'),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.teal, width: 0.5, style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    controller: _teleController,
                    style: TextStyle(color: Colors.teal),
                    cursorColor: Colors.teal,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Téléphone',
                      hintStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Quicksand'),
                    ),
                    onChanged: (String str) {
                      setState(() {
                        //_data.name = str;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),






          //en

          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "Prix",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Quicksand'),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.teal, width: 0.5, style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: TextField(
                    controller: _prixController,
                    style: TextStyle(color: Colors.teal),
                    cursorColor: Colors.teal,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Prix DHs',
                      hintStyle: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Quicksand'),
                    ),
                    onChanged: (String str) {
                      setState(() {
                        //_data.name = str;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              new Expanded(
                child: new Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "Capacité",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: 'Quicksand'),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.teal, width: 0.5, style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue_capacite,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.teal),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue_capacite = newValue;
                      });
                    },
                    items: <String>['1', '2', '3', '4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 10, 0),
                child: Text(
                  'Autres',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.teal, width: 0.5, style: BorderStyle.solid),
              ),
            ),
            padding: const EdgeInsets.only(left: 0.0, right: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "La Cours",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Quicksand'),
                    ),
                    Checkbox(
                      value: terrasse,
                      onChanged: (bool value) {
                        setState(() {
                          terrasse = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Connexion",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Quicksand'),
                    ),
                    Checkbox(
                      value: wifi,
                      onChanged: (bool value) {
                        setState(() {
                          wifi = value;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(width: 40),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Lave-Linge",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: 'Quicksand'),
                    ),
                    Checkbox(
                      value: laveLinge,
                      onChanged: (bool value) {
                        setState(() {
                          laveLinge = value;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            height: 24.0,
          ),
          new Center(
            child: _image == null
                ? Text('Aucune image séléctionné ! ')
                : Image.file(_image, height: 250),
          ),
          FloatingActionButton(
            onPressed: getImage,
            tooltip: 'Pick Image',
            child: Icon(Icons.add_a_photo),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
            alignment: Alignment.center,
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new FlatButton(
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    color: Colors.greenAccent,
                    onPressed: () {
                      suppls = [terrasse, wifi, laveLinge];
                      _addOffre(
                        _latController.text,
                          _longController.text,
                          _prixController.text,
                          _superficieController.text,
                          dropdownValue_capacite,
                          suppls,
                          _image);
                    },
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "Ajouter",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Quicksand'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addOffre(String lat,String long, String prix, String superficie,
      String capacite, List suppls, File image) async {
    Offre _offre = Offre();
    try {
      _offre.prix = prix;
      _offre.superficie = superficie;
      _offre.lat = lat;
      _offre.long=long;
      _offre.capacite = capacite;
      _offre.supplimentaires = suppls;
      _offre.image = image;
      String _returnString = await OurDatabase().createOffre(_offre, context);
    } catch (e) {}
  }
}
