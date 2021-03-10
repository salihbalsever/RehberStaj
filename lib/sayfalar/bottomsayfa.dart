
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/anasayfa.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/favoriler.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/mesajlar.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/profil.dart';
import 'package:rehber_uygulmasi_staj/sayfalar/radio.dart';
import 'package:rehber_uygulmasi_staj/servisler/yetkilendirme.dart';
class BottomSyafa extends StatefulWidget {
  @override
  _BottomSyafaState createState() => _BottomSyafaState();
}

class _BottomSyafaState extends State<BottomSyafa> {
  int sayfaNo = 0;
  PageController sayfaController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sayfaController=PageController();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    sayfaController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final aktifKullaniciId = Provider.of<YetkilendirmeServisi>(context, listen: false).aktifKullaniciId;

    return Scaffold(

      body: PageView(

        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (acilanSayfaNo){
          setState(() {
            sayfaNo=acilanSayfaNo;
          });
        },
        controller: sayfaController,
        children: [
          Anasayfa(profilSahibiId:aktifKullaniciId ,),
          Mesajlar(),
          RadioSayfasi(),
          Favoriler(),
          Profil(profilSahibiId: aktifKullaniciId,)
        ],
      ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            canvasColor: HexColor("#0e2d85")
          ),
          child: BottomNavigationBar(

            currentIndex: sayfaNo,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            backgroundColor: HexColor("#0e2d85"),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text("Anasayfa")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), title: Text("Mesajlar")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.radio), title: Text("Radio")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), title: Text("Favoriler")),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervised_user_circle_outlined),
                  title: Text("Profil")),
            ],
            onTap: (secilenSayfaNo) {
              setState(() {

                sayfaController.jumpToPage(secilenSayfaNo);
              });
            },
          ),
        ),


    );
  }
}
