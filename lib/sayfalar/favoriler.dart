
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class Favoriler extends StatefulWidget {
  @override
  _FavorilerState createState() => _FavorilerState();
}

class _FavorilerState extends State<Favoriler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("Favorilerim",style: TextStyle(fontSize: 20),),backgroundColor: HexColor("#0e2d85"),actions: [

        Container(padding: EdgeInsets.only(right: 15),child: Icon(Icons.exit_to_app)),


      ],),
      body: ListView(),
    );
  }
}
