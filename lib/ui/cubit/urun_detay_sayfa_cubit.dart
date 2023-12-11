import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/yemekler.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/repo/yemekler_dao_repository.dart';


class UrunBilgileri {
  int secilenAdetSayisi;
  int toplamFiyat;

  UrunBilgileri({required this.secilenAdetSayisi, required this.toplamFiyat});
}

class DetaySayfaCubit extends Cubit<UrunBilgileri> {
  DetaySayfaCubit() : super(UrunBilgileri(secilenAdetSayisi: 0, toplamFiyat: 0));

  var repo = YemeklerDaoRepository();

  int urunFiyat = 0;

  /*Future<void> sepeteEkle(Yemekler yemek) async {
    var kullaniciAdi = "erdem_ozturk";
    await repo.sepeteYemekEkle(
        yemek: yemek,
        kullaniciAdi: kullaniciAdi,
        adet: 1,
        yemek_resim_adi: yemek.yemek_resim_adi,
        yemek_adi: yemek.yemek_adi,
        yemek_fiyat: int.parse(yemek.yemek_fiyat));
  }*/
  Future<void> sepeteEkle(Yemekler yemek) async {
    var kullaniciAdi = "erdem_ozturk";
    for (var i = 0; i < state.secilenAdetSayisi; i++) {
      await repo.sepeteYemekEkle(
          yemek: yemek,
          kullaniciAdi: kullaniciAdi,
          adet: 1,
          yemek_resim_adi: yemek.yemek_resim_adi,
          yemek_adi: yemek.yemek_adi,
          yemek_fiyat: int.parse(yemek.yemek_fiyat));
    }
  }

  void urunFiyatiniYolla(int urunFiyati, int islem) {

    if (islem == 1) {
      print("arttir seçildi");
      urunFiyat = urunFiyati;
      arttirma();
    } else {
      print("azalt seçildi");
      urunFiyat = urunFiyati;
      azaltma();
    }
    urunFiyati = urunFiyati;
  }

  void Sifirlama() {

    state.toplamFiyat = 0;
    state.secilenAdetSayisi = 0;
  }

  void arttirma() {
    state.secilenAdetSayisi += 1;
    state.toplamFiyat = state.secilenAdetSayisi * urunFiyat;

    emit(UrunBilgileri(secilenAdetSayisi: state.secilenAdetSayisi, toplamFiyat: state.toplamFiyat));
  }

  void azaltma() {

    if (state.secilenAdetSayisi <= 0) {
      print("adet 0'dan kucuk olamaz");
    } else {
      state.secilenAdetSayisi -= 1;
      state.toplamFiyat = state.secilenAdetSayisi * urunFiyat;
      emit(UrunBilgileri(secilenAdetSayisi: state.secilenAdetSayisi, toplamFiyat: state.toplamFiyat));
    }
  }
}