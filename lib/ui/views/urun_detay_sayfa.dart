import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/yemekler.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/urun_detay_sayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/sepet_sayfa.dart';

class UrunDetaySayfa extends StatefulWidget {
  Yemekler urun;
  UrunDetaySayfa({required this.urun});

  @override
  State<UrunDetaySayfa> createState() => _UrunDetaySayfaState();
}

class _UrunDetaySayfaState extends State<UrunDetaySayfa> {


  Future<void> sepeteekle(String ad,String resim,String fiyat) async {
    print("Sepete Ekle: $ad - $resim - $fiyat");
  }
  Future<void> guncelle (int id,String ad,String resim, String fiyat) async {
    print("üRÜN Güncelle: $id - $ad - $resim - $fiyat");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ürün Detay Sayfa",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold)),),
      body: Center(
        child: BlocBuilder<DetaySayfaCubit,UrunBilgileri>(
          builder: (context,gelenUrunBilgisi){
            return  Card(
              child: Column(
                children: [
                  Row( mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.urun.yemek_resim_adi}"),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shadowColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${widget.urun.yemek_adi}",style: TextStyle(fontSize: 30.0,fontFamily: "Montserrat",fontWeight: FontWeight.bold),),

                            Container(
                              height: 50,
                              width: 115,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Stack(
                                children:[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10,bottom: 8),
                                    child: Text("Sipariş Sayısı",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,

                                      children: [

                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                context.read<DetaySayfaCubit>()
                                                    .urunFiyatiniYolla(int.parse(widget.urun.yemek_fiyat), 0);
                                              });


                                            },
                                            icon: const Icon(Icons.remove)),
                                        Text(gelenUrunBilgisi.secilenAdetSayisi.toString()),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                context
                                                    .read<DetaySayfaCubit>()
                                                    .urunFiyatiniYolla(int.parse(widget.urun.yemek_fiyat), 1);
                                              });

                                            },
                                            icon: const Icon(Icons.add)),
                                      ],
                                    ),
                                  ),
                                ]
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Ürün Fiyatı : ${widget.urun.yemek_fiyat}",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold)),
                        Text("Toplam Fiyat: ${gelenUrunBilgisi.toplamFiyat.toString()}",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),







                  ElevatedButton(
                      onPressed: (){
                    context.read<DetaySayfaCubit>().sepeteEkle(widget.urun);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  SepetSayfa(),
                        ));
                  },
                      child: const Text("Sepete Ekle",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold,color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shadowColor: Colors.white
                      )),




                ],

              ),
            );
          }
        ),
      ),
    );
  }
}
