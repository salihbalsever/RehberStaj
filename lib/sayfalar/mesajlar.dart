
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
class Mesajlar extends StatefulWidget {
  @override
  _MesajlarState createState() => _MesajlarState();
}

class _MesajlarState extends State<Mesajlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Mesajlar",style: TextStyle(fontSize: 20),),backgroundColor: HexColor("#0e2d85"),actions: [
        Icon(Icons.search),
        SizedBox(width: 25,),
        Container(padding: EdgeInsets.only(right: 15),child: Icon(Icons.category_outlined)),


      ],),
      body: ListView(),
    );
  }
}
