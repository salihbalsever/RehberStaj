import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rehber_uygulmasi_staj/modeller/user.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/bottomsayfa.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/login2.dart';
import 'package:rehber_uygulmasi_staj/servisler/yetkilendirme.dart';

class Yonlendirme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _yetkilendirmeServisi = Provider.of<YetkilendirmeServisi>(context, listen: false);
    return StreamBuilder(
        stream: _yetkilendirmeServisi.durumTakipcisi,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            Kullanici aktifKullanici = snapshot.data;
            _yetkilendirmeServisi.aktifKullaniciId= aktifKullanici.id;
            return BottomSyafa();
          } else {
            return LoginIki();
          }
        });
  }
}
