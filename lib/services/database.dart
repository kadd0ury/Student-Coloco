import 'package:mycolocs/models/offre.dart';
import 'package:mycolocs/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class OurDatabase{
  final Firestore _firestore = Firestore.instance;

  Future<String> createUser(OurUser user)async{
    String retVal = "error";
    try{
      await _firestore.collection("users").document(user.uid).setData({
        'fullName' : user.fullName,
        'email' : user.email,
        'phoneNumber' : user.phoneNumber,
        'accountCreated' : Timestamp.now(),

      });
      retVal="success";
    }
    catch(e){
      print(e);
    }
    return retVal;
  }


  Future<String> createOffre(Offre offre , BuildContext cntx)async{
    String retVal = "error";
    try{
      String filename = offre.image.path.split('/').last;
      final StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child(filename);
      StorageUploadTask uploadTask = firebaseStorageRef.putFile(offre.image);

      StorageTaskSnapshot storageSnapshot = await uploadTask.onComplete;

      var downloadUrl = await storageSnapshot.ref.getDownloadURL();

      await _firestore.collection("offres").document(offre.oid).setData({
        'uid' : 'jk',
        'lat' : offre.lat,
        'long':offre.long,
        'prix' : offre.prix,
        'tele':offre.tele,
        'capacite' : offre.capacite,
        'superficie' : offre.superficie,
        'supplimentaires' : offre.supplimentaires,
        'image' : downloadUrl,
        'dateCreation' : Timestamp.now(),
      });

      if (uploadTask.isComplete) {
        var url = downloadUrl.toString();
        print("opération effectué avec succes !");
        Scaffold.of(cntx).showSnackBar(SnackBar(content : Text('opération effectué avec succes !')));

      }


      retVal="success";
    }
    catch(e){
      print(e);
    }
    return retVal;
  }
}