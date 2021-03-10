import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/anasayfa.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/bottomsayfa.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/login2.dart';
import 'package:rehber_uygulmasi_staj/servisler/yetkilendirme.dart';
import 'package:rehber_uygulmasi_staj/yonlendirme.dart';

import 'sayfalar/giris_sayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<YetkilendirmeServisi>(
      create: (_)=>YetkilendirmeServisi() ,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Yonlendirme(),
      ),
    );
  }
}
