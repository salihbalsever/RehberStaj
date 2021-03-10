import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AramaSonuc extends StatefulWidget {
  @override
  _AramaSonucState createState() => _AramaSonucState();
}

class _AramaSonucState extends State<AramaSonuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(backgroundColor: HexColor("#0e2d85"), title:  Text("Arama Sonucu",style: TextStyle(fontSize: 24),),),
    );
  }
}
