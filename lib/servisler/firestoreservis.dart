import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rehber_uygulmasi_staj/modeller/user.dart';

class FirestoreServisi{
  final Firestore _firestore= Firestore.instance;
  Future<void> kullaniciOlustur({id,email,kullaniciAdi, fotoUrl=""}) async {
    await  _firestore.collection("kullanicilar").document(id).setData({
      "kullaniciAdi":kullaniciAdi,
        "email":email,
      "fotoUrl":fotoUrl,
      "dTarih":""
    });
    
  }
  Future<Kullanici> kullaniciGetir(id) async {
   DocumentSnapshot doc= await _firestore.collection("kullanicilar").document(id).get();
    if(doc.exists){
      Kullanici kullanici= Kullanici.dokumandanuret(doc);
      return kullanici;
    }
    return null;
  }
}