import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ProfilSayfa extends StatefulWidget {
  const ProfilSayfa({super.key});

  @override
  State<ProfilSayfa> createState() => _ProfilSayfaState();
}

class _ProfilSayfaState extends State<ProfilSayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profilim"),
      ),
      body: Center(
        child: Card(
          child:
          Column(
            children: [
              Row(  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Erdem Öztürk", style: TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.bold,fontSize: 35),),
                  Spacer(),
                  Text("23", style: TextStyle(fontFamily:"Montserrat",fontWeight: FontWeight.bold,fontSize: 35),)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("erdemzturks@oulook.com"),
                    Text("05443935706"),
                    Text("Adres: Pınarbaşı Mahallesi Avcı Sokak 18/29")
                  ],
                ),
              ),
              SizedBox(
                width: 155,
                height: 50,
                child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.network("https://lottie.host/ade4dcd5-c885-47c3-b4cc-e2ab3e900ee4/IY9KQRFTx4.json"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.network("https://lottie.host/2decf0f4-258c-491f-84fa-f8f2d7719176/udTzeEYY7W.json"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.network("https://lottie.host/3503ec65-f1f7-4a32-921d-99ba7b9cfbd4/FKw57diigF.json"),
                    ),


                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
