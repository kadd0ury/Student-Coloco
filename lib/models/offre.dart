import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class Offre{
  String oid;
  String uid;
  String lat;
  String long;
  String capacite;
  String superficie;
  String tele;
  String prix;
  List supplimentaires;
  File image;
  Timestamp dateCreation;


  Offre({
    this.oid,
    this.uid,
    this.lat,
    this.long,
    this.capacite,
    this.superficie,
    this.prix,
    this.supplimentaires,
    this.image,
    this.dateCreation
  });

}