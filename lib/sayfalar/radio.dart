import 'package:flutter/material.dart';
class RadioSayfasi extends StatefulWidget {
  @override
  _RadioSayfasiState createState() => _RadioSayfasiState();
}

class _RadioSayfasiState extends State<RadioSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Center(child: Text("Almanya FM Radio",style: TextStyle(fontSize: 20),)),backgroundColor:Colors.black54
      ),
      body: Container(
        color: Colors.black54
      ),
    );
  }
}
