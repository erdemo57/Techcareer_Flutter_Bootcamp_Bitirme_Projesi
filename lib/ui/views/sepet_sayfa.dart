import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/sepet.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/yemekler.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/sepete_ekle_sayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/anasayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/sepet_onay_sayfa.dart';
import 'package:lottie/lottie.dart';



class SepetSayfa extends StatefulWidget {



 @override
  State<SepetSayfa> createState() => _SepetSayfaState();
}

class _SepetSayfaState extends State<SepetSayfa> {
  int genelToplam = 0;

  void updateGenelToplam(List<Sepet> sepetListesi) {
    Future.delayed(Duration.zero,(){
     if(!mounted){
       return;
     }
     try{
       Map<String,UrunGrubu> urunGrubs = {};
       int yeniGelenToplam = 0;
       sepetListesi.forEach((urun) {
         var urunAdi = urun.yemek_adi;
         var urunResimAdi = urun.yemek_resim_adi;
         var sepetYemekId = urun.sepet_yemek_id;

         var urunGrubu =  urunGrubs.putIfAbsent(urunAdi,
                 () => UrunGrubu(urunAdi: urunAdi, toplamAdet: 0, urunResimAdi: urunResimAdi, sepetYemekId: int.parse(sepetYemekId)));
         int adet = int.parse(urun.yemek_siparis_adet);
         urunGrubu.toplamAdet += adet;

         yeniGelenToplam += int.parse(urun.yemek_fiyat) * adet;
       });
       setState(() {
         genelToplam = yeniGelenToplam;
         sepetGrup = urunGrubs.values.toList();
       });
       
     }catch(e,stacTrace){
       print("Hata Oluştu$e");
       print("$stacTrace");
     }
    });
  }
  void updateToplamMaliyet(List<Sepet> sepetListesi) {
    int toplamMaliyet = 0;

    sepetGrup.forEach((urunGrubu) {
      try {
        var urun = sepetListesi.firstWhere((urun) =>
        urun.yemek_adi == urunGrubu.urunAdi);
        double urunFiyat = double.parse(urun.yemek_fiyat);
        toplamMaliyet += (urunGrubu.toplamAdet * urunFiyat).toInt();
      } catch (e) {
        print("Hata Oluştu$e");
      }
    });

    setState(() {
      genelToplam = toplamMaliyet;
    });
  }
  


  final String resimurl = "http://kasimadalan.pe.hu/yemekler/resimler/";

  @override
  void initState() {
    super.initState();
    context.read<SepetSayfaCubit>().sepettekiUrunleriAl("erdem_ozturk");
  }
  List<UrunGrubu> sepetGrup = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold)),
      actions: [
        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                setState(() {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Anasayfa(),));
                });


              }, child: Text("Ürün Ekle")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Toplam : $genelToplam", style: TextStyle(fontFamily: "Montserrat", fontWeight: FontWeight.bold,color: Colors.redAccent)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SepetOnaySayfa(),));
              }, child: Text("Sepeti Onayla")),
            ),



          ],
        ),


      ],),
      body:

      BlocBuilder<SepetSayfaCubit,List<Sepet>>(
        builder: (context,sepetListesi){
          if(sepetListesi.isNotEmpty){
            updateGenelToplam(sepetListesi);
            return ListView.builder(
                itemCount: sepetGrup.length,
                itemBuilder: (context, index) {
                  var urunGrubs = sepetGrup[index];
                  return Card(
                    child:
                    Center(
                      child: Row( mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          SizedBox(
                              height: 150,
                              width: 200,
                              child:
                                 Image.network("$resimurl${urunGrubs.urunResimAdi}"),
                              ),
                          Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${urunGrubs.urunAdi}"),
                              Builder(
                                builder: (context) {
                                  try {
                                    var urun = sepetListesi.firstWhere((urun) =>
                                    urun.yemek_adi ==
                                        urunGrubs.urunAdi);
                                    double urunFiyat =
                                    double.parse(urun.yemek_fiyat);
                                    double toplamFiyat =
                                        urunGrubs.toplamAdet * urunFiyat;

                                    return Text(
                                      "Toplam Fiyat: $toplamFiyat",
                                    );
                                  } catch (e) {
                                    print("Hata Oluştu$e");
                                    // Hata durumunda
                                    return const Text(
                                      "Toplam: 0.0",
                                    );
                                  }
                                },
                              ),
                              //Text("Ürün Fiyatı : ${urunGrubs.toplamAdet}",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold)),
                              Text("Ürün Sipariş Adeti: ${urunGrubs.toplamAdet}",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold)),

                              ElevatedButton(
                                 onPressed: () {

                                    context.read<SepetSayfaCubit>().sepettenUrunSil(urunGrubs.sepetYemekId, "erdem_ozturk");
                                    
                                  },
                                  child: const Text("Ürünü sepetten sil",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold)),
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent, shadowColor: Colors.white),
                              ),


                            ],
                          ),


                        ],


                      ),


                    ),



                  );



                },);
          }else{
            return const Center(child: CircularProgressIndicator());
          }
      }
      ),



    );
  }
}


class UrunGrubu {
  String urunAdi;
  int toplamAdet;
  String urunResimAdi;
  int sepetYemekId;

  UrunGrubu(
      {
        required this.urunAdi,
        required this.toplamAdet,
        required this.urunResimAdi,
        required this.sepetYemekId
      });
}
