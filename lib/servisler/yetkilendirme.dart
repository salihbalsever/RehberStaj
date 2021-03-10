import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rehber_uygulmasi_staj/modeller/user.dart';

class YetkilendirmeServisi {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String aktifKullaniciId;

  Kullanici _kullaniciOlustur(FirebaseUser kullanici) {
    return kullanici == null ? null : Kullanici.firebasedenUret(kullanici);
  }

  Stream<Kullanici> get durumTakipcisi {
    return _firebaseAuth.onAuthStateChanged.map(_kullaniciOlustur);
  }

  Future<Kullanici> mailIleKayit(String eposta, String sifre) async {
    var girisKarti = await _firebaseAuth.createUserWithEmailAndPassword(
        email: eposta, password: sifre);
    return _kullaniciOlustur(girisKarti.user);
  }

  Future<Kullanici> mailIleGiris(String eposta, String sifre) async {
  try  {
    var girisKarti = await _firebaseAuth.signInWithEmailAndPassword(
        email: eposta, password: sifre);
    return _kullaniciOlustur(girisKarti.user);


  }catch(e){
    print("/////----------------HATA----------------////////////");

    print(e.toString());
  }
  }

  Future<void> cikisYap() {
    return _firebaseAuth.signOut();
  }
  googleIleGiris() async {
   GoogleSignInAccount googleHesabi= await GoogleSignIn().signIn();
   GoogleSignInAuthentication googleYetkiKartim = await  googleHesabi.authentication;
   AuthCredential sifresizGirisBelgesi= GoogleAuthProvider.getCredential(idToken: googleYetkiKartim.idToken, accessToken: googleYetkiKartim.accessToken);
   AuthResult girisKart= await _firebaseAuth.signInWithCredential(sifresizGirisBelgesi);
   print(girisKart.user.uid);
   print(girisKart.user.displayName);
   print(girisKart.user.photoUrl);
   print(girisKart.user.email);
   return _kullaniciOlustur(girisKart.user);

  }
}
