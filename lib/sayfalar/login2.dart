import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:rehber_uygulmasi_staj/modeller/user.dart';
import 'package:rehber_uygulmasi_staj/servisler/firestoreservis.dart';
import 'package:rehber_uygulmasi_staj/servisler/yetkilendirme.dart';

class LoginIki extends StatefulWidget {
  @override
  _LoginIkiState createState() => _LoginIkiState();
}

class _LoginIkiState extends State<LoginIki> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _scaffoldAnahtari = GlobalKey<ScaffoldState>();

  String mail, kullaniciAdi, dTarih, sifre;

  bool formVisible;
  bool _formsIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //formVisible=false;
    _formsIndex = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: HexColor("#0e2d85"),
        child: _formsIndex == true ? login() : register(),
      ),
    );
  }

  Stack login() {

    return Stack(
      children: [
        ListView(
          //scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 220, horizontal: 40),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.white, spreadRadius: 3),
                ],
              ),
              padding: EdgeInsets.only(top: 15, right: 10, left: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Form(
                  key: _formKey,
                  child:
                      /*SingleChildScrollView(
                    padding: EdgeInsets.only(top: 15),
                    child: ,*/
                      Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Size En Yakın ",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Hizmeti Bulun",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextFormField(
                              autofocus: false,
                              autocorrect: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "Email Adress",
                                labelText: "Email Adress",
                              ),
                              validator: (gelenveri) {
                                if (gelenveri.isEmpty) {
                                  return "Email alanı boş bırakılamaz!";
                                } else if (!gelenveri.contains("@")) {
                                  return "Girilen değer mail formatında olmalı";
                                } else
                                  return null;
                              }),
                          TextFormField(
                            autofocus: false,
                            autocorrect: true,
                            obscureText: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                            ),
                            validator: (girilenDeger) {
                              if (girilenDeger.isEmpty) {
                                return "şifre en 6 karakter olmalı";
                              } else
                                return null;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          OutlineButton(
                              onPressed: _girisYap,
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              textColor: Colors.black,
                              highlightedBorderColor: Colors.black,
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.white),
                          SizedBox(
                            height: 5,
                          ),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  _formsIndex = false;
                                });
                              },
                              child: Text(
                                "Create New Account",
                                style: TextStyle(color: HexColor("#0e2d85")),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(icon: Icon(
                                FontAwesomeIcons.facebook,
                                size: 50,
                              ), onPressed: (){}),

                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                FontAwesomeIcons.twitter,
                                size: 50,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(icon: Icon(
                                FontAwesomeIcons.google,
                                size: 50,
                              ), onPressed: _googleGiris),

                            ],
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }

  Stack register() {
    return Stack(
      key: _scaffoldAnahtari,

      children: [
        ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 220, horizontal: 40),
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.white, spreadRadius: 3),
                ],
              ),
              padding: EdgeInsets.only(top: 15, right: 10, left: 10),

              /* decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(16.0),),
               decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),*/
              width: 250,
              height: 550,
              child: Form(
                  key: _formKey,
                  child:
                      /*SingleChildScrollView(
                        padding: EdgeInsets.only(top: 15),
                        child: ,*/
                      Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Size En Yakın ",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Hizmeti Bulun",
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          TextFormField(
                            autofocus: false,
                            autocorrect: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Email Adress",
                              labelText: "Email Adress",
                            ),
                            validator: (a) {
                              if (a.isEmpty) {
                                return "Email alanı boş bırakılamaz!";
                              } else if (!a.contains("@")) {
                                return "Girilen değer mail formatında olmalı";
                              } else
                                return null;
                            },
                            onSaved: (girilenDeger) {
                              mail = girilenDeger;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            autofocus: false,
                            autocorrect: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Username",
                              labelText: "Username",
                            ),
                            validator: (gelenveri) {
                              if (gelenveri.isEmpty) {
                                return "Kullanıcı alanı boş bırakılamaz!";
                              } else
                                return null;
                            },
                            onSaved: (girilenDeger) {
                              kullaniciAdi = girilenDeger;
                            },
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          DateTimePicker(
                            initialValue: '',
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            dateLabelText: 'Date',
                            onChanged: (val) => print(val),
                            validator: (val) {
                              print(val);
                              return null;
                            },
                            onSaved: (girilenDeger) => dTarih = girilenDeger,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            autofocus: false,
                            autocorrect: true,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              hintText: "Password",
                              labelText: "Password",
                            ),
                            validator: (girilenDeger) {
                              if (girilenDeger.isEmpty) {
                                return "şifre en 6 karakter olmalı";
                              } else
                                return null;
                            },
                            onSaved: (girilenDeger) {
                              sifre = girilenDeger;
                            },
                          ),
                          OutlineButton(
                              onPressed: _kulaniciKayit,
                              child: Text(
                                "Singup",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              textColor: Colors.black,
                              highlightedBorderColor: Colors.black,
                              borderSide: BorderSide(
                                width: 2.0,
                                color: Colors.black,
                                style: BorderStyle.solid,
                              ),
                              color: Colors.white),
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  _formsIndex = true;
                                });
                              },
                              child: Text(
                                "Already have a account ",
                                style: TextStyle(color: Colors.redAccent),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                FontAwesomeIcons.facebook,
                                size: 50,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                FontAwesomeIcons.twitter,
                                size: 50,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                FontAwesomeIcons.google,
                                size: 50,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }

  void _kulaniciKayit() async {
    final focusNode = FocusNode();
    final _yetkilendirmeServisi = Provider.of<YetkilendirmeServisi>(context, listen: false);

    var _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      focusNode.unfocus();

    try{
      print("bak bura mail gelivi $mail");
     Kullanici kullanici=  await _yetkilendirmeServisi.mailIleKayit(mail, sifre);
     if(kullanici!=null){
       FirestoreServisi().kullaniciOlustur(id: kullanici.id,email: mail, kullaniciAdi: kullaniciAdi);
       print(kullanici.toString());
       FocusScope.of(context).unfocus();
     }
      Navigator.pop(context);
     print(kullanici.toString());
    }catch(hata){
print(hata.toString());


    }
    }

  }

  void _girisYap() {
    if (_formKey.currentState.validate()) {
      print("giriş başarılı");
    }
  }

  void _googleGiris() async {
    var _yetkilendirmeServisi = Provider.of<YetkilendirmeServisi>(context, listen: false);

    try {

      Kullanici kullanici = await _yetkilendirmeServisi.googleIleGiris();
      print("bak bura mail gelivi {$kullanici.email}");
      if (kullanici != null) {
        Kullanici fireStoreKullanici= await FirestoreServisi().kullaniciGetir(kullanici.id);
          if(fireStoreKullanici == null){
            FirestoreServisi().kullaniciOlustur(
                id: kullanici.id,
                email: kullanici.email,
                kullaniciAdi: kullanici.userName,
                fotoUrl: kullanici.fotoUrl
            );
            print("kulanıcı oluşşturuldu ");
          }
        print("ksyıt başarılı oldu $kullanici");
      }
    }catch(hata){
      print("/////----------------HATA----------------////////////");
     uyariGoster(hataKodu: hata.hashCode);
    }
    }

  uyariGoster({hataKodu}) {
    String hataMesaji;

    if (hataKodu == "ERROR_USER_NOT_FOUND") {
      hataMesaji = "Böyle bir kullanıcı bulunmuyor";
    } else if (hataKodu == "ERROR_INVALID_EMAIL") {
      hataMesaji = "Girdiğiniz mail adresi geçersizdir";
    } else if (hataKodu == "ERROR_WRONG_PASSWORD") {
      hataMesaji = "Girilen şifre hatalı";
    } else if (hataKodu == "ERROR_USER_DISABLED") {
      hataMesaji = "Kullanıcı engellenmiş";
    } else {
      hataMesaji = "Tanımlanamayan bir hata oluştu $hataKodu";
    }

    var snackBar = SnackBar(content: Text(hataMesaji));
    // ignore: deprecated_member_use
    _scaffoldAnahtari.currentState.showSnackBar(snackBar);
  }
  }


