import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/anasayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/aramasayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/profil_Sayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/sepet_sayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/urun_detay_sayfa.dart';
import 'package:lottie/lottie.dart';

class BottomSayfa extends StatefulWidget {
  const BottomSayfa({super.key});

  @override
  State<BottomSayfa> createState() => _BottomSayfaState();
}

class _BottomSayfaState extends State<BottomSayfa> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            body: TabBarView(
                children: [
                  Anasayfa(),
                  ProfilSayfa(),
                  AramaSayfa(),


                ]),
            extendBody: true,
            floatingActionButtonLocation: FloatingActionButtonLocation
                .endDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SepetSayfa(),));
              },
              child: SizedBox(
                  width: 55,
                  height: 45,
                  child: Lottie.network("https://lottie.host/5185a592-9359-4119-a1ed-9ae770f18450/Ot7uxoszaG.json")),
            ),
            bottomNavigationBar: const BottomAppBar(
              notchMargin: 10.0,
              shape: CircularNotchedRectangle(),
              child: TabBar(
                labelPadding: EdgeInsets.only(left: 20,right: 75,bottom: 15),

                tabs: [
                  Tab(icon: Icon(Icons.home),),
                  Tab(icon: Icon(Icons.person),),
                  Tab(icon: Icon(Icons.search),),


                ],
              ),
            )));
  }
}
















    /*Scaffold(
      body: sayfalar[secilenIndeks],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar:

        BottomNavigationBar(



        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined),label: "Ana Sayfa"),
    BottomNavigationBarItem(icon: Icon(Icons.heart_broken),label: "Favorilerim"),
    BottomNavigationBarItem(icon: Icon(Icons.heart_broken),label: "Profil"),


    ],
    currentIndex: secilenIndeks,
    backgroundColor: Colors.blue,
    selectedItemColor: Colors.black54,
    unselectedItemColor: Colors.black12,
    iconSize: 30,
    onTap: (indeks){
    setState(() {
    secilenIndeks = indeks;
    });
    },



    ),
    );
  }
}*/
