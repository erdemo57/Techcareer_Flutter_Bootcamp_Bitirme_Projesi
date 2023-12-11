/*import 'package:flutter_bootcamp_bitirme_projesi/data/repo/yemekler_dao_repository.dart';

class FavoriSayfaCubit{


  var repo = YemeklerDaoRepository();
  Future<void> favoriUrunleriCek(String kullanici_adi) async {
    try {
      var sepetListesi = await repo.sepettekiUrunleriCek(kullanici_adi);
      emit(sepetListesi);
    } catch (e) {
      print("sepet boş geldi");
      emit([]);
    }
  }

  Future<void> sepetUrunSil(int sepet_yemek_id, String kullanici_adi) async {
    await repo.sepetUrunSil(sepet_yemek_id, kullanici_adi);
    await favoriUrunleriCek(kullanici_adi);
  }
}*/
