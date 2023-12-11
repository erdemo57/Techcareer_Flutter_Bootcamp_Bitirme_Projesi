import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/yemekler.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/repo/yemekler_dao_repository.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {

  AnasayfaCubit(): super(<Yemekler>[]);

  var repo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async {
    var liste = await repo.yemekleriYukle();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    print("Kişi ARA : $aramaKelimesi");
  }

}
/*Future<void> favoriEkle(Yemekler yemek) async {
  var kullaniciAdi = "erdem_ozturk";
  await repo.sepeteYemekEkle(
      yemek: yemek,
      kullaniciAdi: kullaniciAdi,
      adet: state.secilenAdetSayisi,
      yemek_resim_adi: yemek.yemek_resim_adi,
      yemek_adi: yemek.yemek_adi,
      yemek_fiyat: int.parse(yemek.yemek_fiyat));
}
 */