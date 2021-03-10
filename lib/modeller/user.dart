import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Kullanici{
  final String id;
  final String userName;
  final String email;
  final String fotoUrl;

  Kullanici({@required this.id, this.userName, this.email, this.fotoUrl});

  factory Kullanici.firebasedenUret(FirebaseUser user){
    return Kullanici(id:user.uid,
    userName: user.displayName,
      email: user.email,
      fotoUrl: user.photoUrl
    );


  }

  factory Kullanici.dokumandanuret(DocumentSnapshot doc){
    return Kullanici(
        id: doc.documentID,
        userName: doc['kullaniciAdi'],
        email: doc['email'],
      fotoUrl: doc['fotoUrl']

    );
  }
}