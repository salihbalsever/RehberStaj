import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:date_time_picker/date_time_picker.dart';

class GirisSayfasi extends StatefulWidget {
  @override
  _GirisSayfasiState createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool _formIndex;
  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    _formIndex=true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

     home: _formIndex==true?kayitAlan():uyeAlan(),
    );
    /*Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: [
            Center(
              child: Container(
                child: Card(
                  color: Colors.white,
                  elevation: 6.0,
                  margin: EdgeInsets.only(right: 15.0, left: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
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
                        children: [],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
        Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 60.0, right: 20, left: 20),
        children: [
          FlutterLogo(size: 90),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Size En Yakın ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "Hizmeti Bulun",
                style: TextStyle(fontSize: 20),
              ),
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
                    filled: true,
                    fillColor: Colors.red),
                validator: (gelenveri) => "En az 3 karakter gir",
              ),
              TextField(
                autofocus: false,
                autocorrect: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    //filled: true,
                    fillColor: Colors.red),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Login"),
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );*/
  }

  Scaffold kayitAlan() {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        /*  padding: EdgeInsets.all(10.0),
      color: Colors.white,
      width: 800, height: 800,*/
        child: Stack(
          children: [
            Image.asset("assets/contact.png"),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(50)),
            ),
            Center(
              child: Card(
                child: Material(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                    padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                    height: 370,
                    color: Colors.white,
                    width: 400,
                    //padding: EdgeInsets.only(top:100, bottom: 25),
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
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
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
                                    return "Hata var";
                                  }
                                ),
                                TextFormField(
                                  autofocus: false,
                                  autocorrect: true,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    labelText: "Password",
                                  ),validator: (girilenDeger){
                                    return "şifre en 6 karakter olmalı";
                                },
                                ),
                                SizedBox(height: 10,),
                                FlatButton(
                                    onPressed: () {
                                      _formKey.currentState.validate();

                                    },
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    color: Colors.red),
                               FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _formIndex=false;
                                      });
                                    },
                                    child: Text(
                                      "Create New Account",
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
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Scaffold uyeAlan() {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        /*  padding: EdgeInsets.all(10.0),
      color: Colors.white,
      width: 800, height: 800,*/
        child: Stack(
          children: [
            Image.asset("assets/contact.png"),
            Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(50)),
            ),
            Center(
              child: Card(
                child: Material(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(80),
                  child: Container(
                    padding: EdgeInsets.only(top: 15, right: 10, left: 10),
                    height: 400,
                    color: Colors.white,
                    width: 400,
                    //padding: EdgeInsets.only(top:100, bottom: 25),
                    child: Expanded(
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
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
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
                                        return "Hata var";
                                      }
                                  ),

                                  SizedBox(height: 10,),
                                  TextFormField(
                                      autofocus: false,
                                      autocorrect: true,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                        hintText: "Username",
                                        labelText: "Username",
                                      ),
                                      validator: (gelenveri) {
                                        return "Hata var";
                                      }
                                  ),
                          SizedBox(height: 10,),
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
                            onSaved: (val) => print(val),
                          ),
                                  SizedBox(height: 10,),
                                  TextFormField(
                                    autofocus: false,
                                    autocorrect: true,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      hintText: "Password",
                                      labelText: "Password",
                                    ),validator: (girilenDeger){
                                    return "şifre en 6 karakter olmalı";
                                  },
                                  ),
                                  FlatButton(
                                      onPressed: () {
                                        _formKey.currentState.validate();
                                      },
                                      child: Text(
                                        "Login",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      color: Colors.red),
                                  FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          _formIndex=true;
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
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
