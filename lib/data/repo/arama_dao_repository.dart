import 'package:flutter_bootcamp_bitirme_projesi/data/entity/arama.dart';

class AramaDaoRepository{

  Future<List<Arama>> yemekleriYukle() async {
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



    var urunlerListesi = <Arama>[];
    var y1 = Arama(yemek_id: 1, yemek_adi: "Ayran", yemek_resim_adi: ayran, yemek_fiyat: 3);
    var y2 = Arama(yemek_id: 1, yemek_adi: "Baklava", yemek_resim_adi: baklava, yemek_fiyat: 25);
    var y3 = Arama(yemek_id: 1, yemek_adi: "Fanta", yemek_resim_adi: Fanta, yemek_fiyat: 6);
    var y4 = Arama(yemek_id: 1, yemek_adi: "Izgara Somon", yemek_resim_adi: IzgaraSomon, yemek_fiyat: 55);
    var y5 = Arama(yemek_id: 1, yemek_adi: "Izgara Tavuk", yemek_resim_adi: IzgaraTavuk, yemek_fiyat: 27);
    var y6 = Arama(yemek_id: 1, yemek_adi: "kadayif", yemek_resim_adi: kadayif, yemek_fiyat: 22);
    var y7 = Arama(yemek_id: 1, yemek_adi: "Köfte", yemek_resim_adi: kofte, yemek_fiyat: 16);
    var y8 = Arama(yemek_id: 1, yemek_adi: "Lazanya", yemek_resim_adi: lazanya, yemek_fiyat: 25);
    var y9 = Arama(yemek_id: 1, yemek_adi: "Makarna", yemek_resim_adi: makarna, yemek_fiyat: 32);
    var y10 = Arama(yemek_id: 1, yemek_adi: "Pizza", yemek_resim_adi: pizza, yemek_fiyat: 28);
    var y11 = Arama(yemek_id: 1, yemek_adi: "Su", yemek_resim_adi: su, yemek_fiyat: 45);
    var y12 = Arama(yemek_id: 1, yemek_adi: "Sütlaç", yemek_resim_adi: sutlac, yemek_fiyat: 2);
    var y13 = Arama(yemek_id: 1, yemek_adi: "Tiramisu", yemek_resim_adi: tiramisu, yemek_fiyat: 10);

    urunlerListesi.add(y1);
    urunlerListesi.add(y2);
    urunlerListesi.add(y3);
    urunlerListesi.add(y4);
    urunlerListesi.add(y5);
    urunlerListesi.add(y6);
    urunlerListesi.add(y7);
    urunlerListesi.add(y8);
    urunlerListesi.add(y9);
    urunlerListesi.add(y10);
    urunlerListesi.add(y11);
    urunlerListesi.add(y12);
    urunlerListesi.add(y13);

    return urunlerListesi;



  }
  Future<List<Arama>> ara(String aramaKelimesi) async {
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

    var urunlerListesi = <Arama>[];
    var y1 = Arama(yemek_id: 1, yemek_adi: "Ayran", yemek_resim_adi: ayran, yemek_fiyat: 3);
    var y2 = Arama(yemek_id: 1, yemek_adi: "Baklava", yemek_resim_adi: baklava, yemek_fiyat: 25);
    var y3 = Arama(yemek_id: 1, yemek_adi: "Fanta", yemek_resim_adi: Fanta, yemek_fiyat: 6);
    var y4 = Arama(yemek_id: 1, yemek_adi: "Izgara Somon", yemek_resim_adi: IzgaraSomon, yemek_fiyat: 55);
    var y5 = Arama(yemek_id: 1, yemek_adi: "Izgara Tavuk", yemek_resim_adi: IzgaraTavuk, yemek_fiyat: 27);
    var y6 = Arama(yemek_id: 1, yemek_adi: "kadayif", yemek_resim_adi: kadayif, yemek_fiyat: 22);
    var y7 = Arama(yemek_id: 1, yemek_adi: "Köfte", yemek_resim_adi: kofte, yemek_fiyat: 16);
    var y8 = Arama(yemek_id: 1, yemek_adi: "Lazanya", yemek_resim_adi: lazanya, yemek_fiyat: 25);
    var y9 = Arama(yemek_id: 1, yemek_adi: "Makarna", yemek_resim_adi: makarna, yemek_fiyat: 32);
    var y10 = Arama(yemek_id: 1, yemek_adi: "Pizza", yemek_resim_adi: pizza, yemek_fiyat: 28);
    var y11 = Arama(yemek_id: 1, yemek_adi: "Su", yemek_resim_adi: su, yemek_fiyat: 45);
    var y12 = Arama(yemek_id: 1, yemek_adi: "Sütlaç", yemek_resim_adi: sutlac, yemek_fiyat: 2);
    var y13 = Arama(yemek_id: 1, yemek_adi: "Tiramisu", yemek_resim_adi: tiramisu, yemek_fiyat: 10);

    urunlerListesi.add(y1);
    urunlerListesi.add(y2);
    urunlerListesi.add(y3);
    urunlerListesi.add(y4);
    urunlerListesi.add(y5);
    urunlerListesi.add(y6);
    urunlerListesi.add(y7);
    urunlerListesi.add(y8);
    urunlerListesi.add(y9);
    urunlerListesi.add(y10);
    urunlerListesi.add(y11);
    urunlerListesi.add(y12);
    urunlerListesi.add(y13);

    Iterable <Arama> filtreleme = urunlerListesi.where((urunNesnesi) {
      return urunNesnesi.yemek_adi.toLowerCase().contains(aramaKelimesi.toLowerCase());
    });

    return filtreleme.toList();
  }
}