import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/anasayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/profil_Sayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/sepet_onay_sayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/sepet_sayfa.dart';

class BottomForSepetOnay extends StatefulWidget {
  const BottomForSepetOnay({super.key});

  @override
  State<BottomForSepetOnay> createState() => _BottomForSepetOnayState();
}

class _BottomForSepetOnayState extends State<BottomForSepetOnay> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            body: const TabBarView(
                children: [
                  Anasayfa(),
                  ProfilSayfa(),
                ]),
            extendBody: true,
            floatingActionButtonLocation: FloatingActionButtonLocation
                .centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SepetOnaySayfa(),));
              },
              child: const Text("Sepeti Onayla"),
            ),
            bottomNavigationBar: const BottomAppBar(
              notchMargin: 15,
              shape: CircularNotchedRectangle(),
              child: TabBar(

                tabs: [Tab(text: "Ana Sayfa"),Tab(text: "Favori")],
              ),
            )));
  }
}

