import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/sepet.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/sepet_cevap.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/yemek_cevap.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/yemekler.dart';

class YemeklerDaoRepository{



    List<Yemekler> parseYemeklerCevap(String cevap) {
      return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
    }


  Future<List<Yemekler>> yemekleriYukle() async {
    var url = "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php";
    var cevap = await Dio().get(url);
    return parseYemeklerCevap(cevap.data.toString());
  }


    List<Sepet> parseSepetUrunleriCevap(String cevap) {
      return SepetCevap.fromJson(json.decode(cevap)).sepetListesi;
    }
    Future<List<Sepet>> sepettekiUrunleriCek(String kullanici_adi) async {
      var url = "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php";
      List<Sepet> hataOlmasiDurumundaList = [];
      try {
        var veri = {"kullanici_adi": kullanici_adi};
        var cevap = await Dio().post(url, data: FormData.fromMap(veri));
        print("sepetteki ürünler getirildi: ${cevap.data.toString()}");
        return parseSepetUrunleriCevap(cevap.data.toString());
      } catch (hata) {
        print("Hata oluştu: $hata");
        return hataOlmasiDurumundaList;
      }
    }

    Future<void> sepeteYemekEkle(
        {
          required String yemek_resim_adi,
          required String yemek_adi,
          required String kullaniciAdi,
          required int adet,
          required int yemek_fiyat,
          required Yemekler yemek}
        ) async {
      var url = "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php";
      try {
        var veri = {
          "yemek_adi": yemek_adi,
          "yemek_resim_adi": yemek_resim_adi,
          "yemek_fiyat": yemek_fiyat.toString(),
          "yemek_siparis_adet": adet.toString(),
          "kullanici_adi": kullaniciAdi,
        };
        var cevap = await Dio().post(url, data: FormData.fromMap(veri));
        print("Sepete ürün başariyla eklendi: ${cevap.data.toString()}");
      } catch (hata) {
        print("Hata oluştu: $hata");
      }
    }
    Future<void> sepetUrunSil(int sepet_yemek_id, String kullanici_adi) async {
      var url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
      var veri = {"sepet_yemek_id": sepet_yemek_id.toString(), "kullanici_adi": kullanici_adi};
      var cevap = await Dio().post(url, data: FormData.fromMap(veri));
      print("yemek basarili bir sekilde silindi ${cevap.data.toString()}");
    }

}