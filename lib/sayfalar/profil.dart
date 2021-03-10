import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:rehber_uygulmasi_staj/modeller/user.dart';
import 'package:rehber_uygulmasi_staj/servisler/firestoreservis.dart';
import 'package:rehber_uygulmasi_staj/servisler/yetkilendirme.dart';

class Profil extends StatefulWidget {
  final String profilSahibiId;

  const Profil({Key key, this.profilSahibiId}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  bool mode;

  @override
  void initState() {
    super.initState();
    mode = true;
    generateList();
  }

  List<NewModel> newModelList = [];

  void generateList() {
    setState(() {
      newModelList.add(NewModel(
          entry: 'Privacy',
          iconData: Icons.privacy_tip,
          function: () {
            // GoToPrivacy();
          }));

      newModelList.add(NewModel(
          entry: 'Purchase History',
          iconData: Icons.history,
          function: () {
            // GoToHistory();
          }));

      newModelList.add(NewModel(
          entry: 'Help & Support',
          iconData: Icons.help,
          function: () {
            // GoToHelp();
          }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profilim",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: HexColor("#0e2d85"),
          actions: [
            Container(
                padding: EdgeInsets.only(right: 15),
                child: IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: _cikisYap,
                )),
          ], /*mode == true ? lightMode() : darkMode()*/
        ),
        body: FutureBuilder<Object>(
            future: FirestoreServisi().kullaniciGetir(widget.profilSahibiId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              return _profilDetaylari(snapshot.data);
            }));
  }

  Widget _profilDetaylari(Kullanici profilData) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          IconButton(
              icon: Icon(FontAwesomeIcons.moon, size: 30),
              onPressed: () {
                setState(() {
                  mode = false;
                });
              })
        ]),
      ),
      Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[300],
                radius: 50.0,
                backgroundImage: NetworkImage(profilData.fotoUrl),
              ),
              Positioned(
                  child: Container(
                child: CircleAvatar(
                  child: Icon(
                    Icons.edit,
                    color: Colors.yellow,
                    size: 15,
                  ),
                ),
              )),
            ],
          ),
          Column(
            children: [
              Text(profilData.userName),
              SizedBox(
                height: 10,
              ),
              Text(profilData.email),
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 200,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.yellow[200],
                    child: Text(
                      "Upgrade to PRO",
                      style: TextStyle(color: Colors.black),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ))
            ],
          )
        ],
      ),
      Expanded(
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: newModelList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(color: Colors.white, spreadRadius: 5),
                    ],
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(newModelList[index].iconData),
                        Text('${newModelList[index].entry}'),
                        Icon(Icons.arrow_forward_ios_outlined)
                      ],
                    ),
                  ),
                ),
              );
            }),
      )
    ]);
  }

  /*lightMode() {
    return _profilDetaylari;
  }*/

  Container darkMode() {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              IconButton(
                  icon: Icon(Icons.wb_sunny_outlined, size: 30),
                  onPressed: () {
                    setState(() {
                      mode = true;
                    });
                  })
            ]),
          ),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(80),
                      image: DecorationImage(
                          image: AssetImage("assets/BG.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                      left: 120,
                      child: Container(
                        child: CircleAvatar(
                          child: Icon(
                            Icons.edit,
                            color: Colors.yellow,
                            size: 15,
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                children: [
                  Text("Salih"),
                  SizedBox(
                    height: 10,
                  ),
                  Text("salih@gmail.com"),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 200,
                      child: RaisedButton(
                        onPressed: () {},
                        color: Colors.yellow[200],
                        child: Text(
                          "Upgrade to PRO",
                          style: TextStyle(color: Colors.black),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ))
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: newModelList.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
                        boxShadow: [
                          BoxShadow(color: Colors.white, spreadRadius: 5),
                        ],
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(newModelList[index].iconData),
                            Text('${newModelList[index].entry}'),
                            Icon(Icons.arrow_forward_ios_outlined)
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

  void _cikisYap() {
    Provider.of<YetkilendirmeServisi>(context, listen: false).cikisYap();
  }
}

class NewModel {
  NewModel({this.entry, this.iconData, this.function});

  String entry;
  IconData iconData;
  Function function;
}
