import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/arama.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/yemekler.dart';
import 'package:flutter_bootcamp_bitirme_projesi/ui/cubit/arama_sayfa_cubit.dart';
import 'package:lottie/lottie.dart';

class AramaSayfa extends StatefulWidget {
  const AramaSayfa({super.key});

  @override
  State<AramaSayfa> createState() => _AramaSayfaState();
}

class _AramaSayfaState extends State<AramaSayfa> {
  var ayran = "ayran.png";
  var baklava = "baklava.png";
  var Fanta = "fanta.png";
  var IzgaraSomon = "izgarasomon.png";
  var IzgaraTavuk = "izgaratavuk.png";
  var kadayif = "kadayif.png";
  var kahve = "kahve.png";
  var kofte = "kofte.png";
  var lazanya = "lazanya.png";
  var makarna = "makarna.png";
  var pizza = "pizza.png";
  var su = "su.png";
  var sutlac = "sutlac.png";
  var tiramisu = "tiramisu.png";


  var liste = [7.5,5.3,4.0,7.7,8.3,3.5,4.7,6.0,5.1,1.3,1.1,9.0,8.9,2.3];

  bool aramaYapiliyorMu = false;


  @override
  void initState() {
    super.initState();
    context.read<AramaSayfaCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu){
            context.read<AramaSayfaCubit>().ara(aramaSonucu);

          },
        )
            :
        Text("Merhaba, Ne Yemek İstersin!!") ,
      actions: [
        aramaYapiliyorMu?
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = false;
          });
        }, icon: const Icon(Icons.clear))
            :
        IconButton(onPressed: (){
          setState(() {
            aramaYapiliyorMu = true;
          });
        }, icon: const Icon(Icons.search))
      ],),

      body: BlocBuilder<AramaSayfaCubit,List<Arama>>(
        builder: (context, urunlerListesi){
          if(urunlerListesi.isNotEmpty){
           return ListView.builder(
                itemCount: urunlerListesi.length,
                itemBuilder: (context, indeks){
                  var urun = urunlerListesi[indeks];
                  return Card(
                    child:
                    SizedBox(
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
                                            style: TextStyle(color: Colors.white),
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
                                IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
                                SizedBox(
                                    width: 50,
                                    height: 45,
                                    child: Lottie.network("https://lottie.host/6d36e07b-fb35-4746-a340-24c9339aaa19/OYFauGV6Jk.json")),
                                SizedBox(
                                    width: 75,
                                    child: const Text("Ücretsiz Teslimat",style: TextStyle(fontFamily: "Montserrat",fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          )

                        ],

                      ),

                    ),
                  ),

                  );
                });

          }else{
            return const Center();
          }
        },
      ) ,
    );
  }
}
