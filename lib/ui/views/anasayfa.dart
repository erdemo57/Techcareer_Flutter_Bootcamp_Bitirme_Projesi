import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/yemekler.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/urun_detay_sayfa_cubit.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/aramasayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/profil_Sayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/sepet_sayfa.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/views/urun_detay_sayfa.dart';
import 'package:lottie/lottie.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {



  var liste = [7.5,5.3,4.0,7.7,8.3,3.5,4.7,6.0,5.1,1.3,1.1,9.0,8.9,2.3];


  @override
  void initState() {
   super.initState();
   context.read<AnasayfaCubit>().yemekleriYukle();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Merhaba, Ne Yemek İstersin!!",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold),),
      actions: [
        IconButton(onPressed: (){

          Navigator.push(context, MaterialPageRoute(builder: (context) => AramaSayfa(),));
        }, icon: const Icon(Icons.search))
      ],),
      body:
      Column(
        children: [
          Expanded(
            child: BlocBuilder<AnasayfaCubit,List<Yemekler>>
                    (
                      builder: (context,yemekler){
                        if(yemekler.isNotEmpty){

                        return Container(

                            height: 300,
                            width: 500,


                            child: ListView.builder(
                                itemCount: yemekler.length,

                                itemBuilder: (context,indeks){
                                  var urun = yemekler[indeks];
                                  return GestureDetector(
                                    onTap: (){


                                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  UrunDetaySayfa(urun: urun),))
                                      .then((value){
                                        print("Ana Sayfaya dönüldü");
                                      });
                                    },
                                    child: Card(
                                      child: SizedBox(
                                        height: 150,
                                        child:   Center(
                                          child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                            children: [
                                              Container(height:200,width:150,

                                                  child: Stack(
                                                    alignment: Alignment.bottomLeft,
                                                    children: [SizedBox(
                                                        height: 150,
                                                        width: 300,
                                                        child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${urun.yemek_resim_adi}",
                                                          fit: BoxFit.contain,)),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        height: 30,
                                                        width: 60,
                                                        decoration: const BoxDecoration(
                                                            shape: BoxShape.rectangle,
                                                            color: Colors.redAccent,
                                                            borderRadius: BorderRadius.all(Radius.circular(20))),
                                                        child:  Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children:[
                                                            SizedBox(
                                                                height: 30,
                                                                width: 30,
                                                                child: Image.asset("resimler/rating.png")),
                                                            Text(liste[indeks].toString(),
                                                              style: const TextStyle(color: Colors.white),
                                                            ),

                                                          ],


                                                        ),
                                                      ),

                                                    ) ], )),
                                              Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Text(urun.yemek_adi,style: const TextStyle(fontSize: 20,fontFamily: "Montserrat",fontWeight: FontWeight.bold),),
                                                  Text("${urun.yemek_fiyat}₺",style: const TextStyle(fontSize: 20,fontFamily: "Montserrat",fontWeight: FontWeight.bold),),
                                                ],
                                              ),
                                              Center(
                                                child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    IconButton(onPressed: (){
                                                     Navigator.push(context, MaterialPageRoute(builder: (context) => UrunDetaySayfa(urun: urun),));
                                                    }, icon: const Icon(Icons.add)),
                                                    SizedBox(
                                                        width: 50,
                                                        height: 45,
                                                        child: Lottie.network("https://lottie.host/6d36e07b-fb35-4746-a340-24c9339aaa19/OYFauGV6Jk.json")),
                                                    const SizedBox(
                                                        width: 75,
                                                        child: Text("Ücretsiz Teslimat",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold),)),
                                                  ],
                                                ),
                                              )

                                            ],

                                          ),

                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          );


                        }else{
                          return const Center();
                        }
                      }
                  ),
          ),
        ],
      ),









    );


  }

}
