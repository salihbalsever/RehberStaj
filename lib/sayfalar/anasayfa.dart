import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rehber_uygulmasi_staj/modeller/user.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/arama_sonuc.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/filter_sayfa.dart';
import 'package:rehber_uygulmasi_staj/servisler/firestoreservis.dart';
import 'package:slider/slider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Anasayfa extends StatefulWidget {
  final String profilSahibiId;

  const Anasayfa({Key key, this.profilSahibiId}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  GoogleMapController _controller;
  double _currentSliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                height: 244,
                width: double.infinity,
                padding: EdgeInsets.only(top: 75, right: 15, left: 15),
                color: HexColor("#0e2d85"),
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Center(
                            child: Icon(

                              FontAwesomeIcons.userCircle,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),SizedBox(width: 15,),
                          Padding(
                            padding: const EdgeInsets.only(top:20),
                            child: Container(
                              width: MediaQuery.of(context).size.width-210,
                              child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                  Text(
                                    "İyi Günler",
                                    style:
                                        TextStyle(color: Colors.white, fontSize: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  FutureBuilder<Object>(
                                      future: FirestoreServisi()
                                          .kullaniciGetir(widget.profilSahibiId),
                                      builder: (context, snapshot) {
                                        if (!snapshot.hasData) {
                                          return Center(child: CircularProgressIndicator());
                                        }
                                        return _ku(snapshot.data);
                                      }),
                                ],
                              ),
                            ),
                          ),

                          IconButton(
                              icon: Icon(Icons.filter_vintage),
                              iconSize: 55.0,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FiltreSayfa()));
                              })
                        ],
                      ),
                    ),
                    Center(
                        child: Text(
                      "Size En İyi Yakın Hizmeti Bulun",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        width: 300,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.white,
                          child: Text(
                            "Ne Arıyorsunuz?",
                            style: TextStyle(color: Colors.black),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        )),
                  ],
                )),
            Container(
              width: double.infinity,
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 340,
                        child: Slider(
                          activeColor: HexColor("#0e2d85"),
                          inactiveColor: Colors.grey,
                          value: _currentSliderValue,
                          min: 0,
                          max: 100,
                          divisions: 5,
                          label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                            });
                          },
                        ),
                      ),
                      Text(
                        "Konumunuza göre aranan uzaklık $_currentSliderValue KM ",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )
                    ],
                  ),
                  Container(
                    width: 90,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.grey, spreadRadius: 3),
                      ],
                    ),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AramaSonuc()));
                      },
                      color: Colors.grey,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Üye",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(

              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              color: Colors.green,
              child: Center(
                child: GoogleMap(onMapCreated: _onMapCreated, initialCameraPosition: CameraPosition(
                    target: LatLng(41.2878742, 36.326696),
                zoom: 6), ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _ku(Kullanici kullanici) => Text(
        kullanici.userName,
        style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
      );

  void _onMapCreated(GoogleMapController controller) {
    _controller= controller;
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
