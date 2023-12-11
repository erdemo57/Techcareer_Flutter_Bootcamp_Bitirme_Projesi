import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/sepet.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/repo/yemekler_dao_repository.dart';

class SepetSayfaCubit extends Cubit<List<Sepet>> {
  SepetSayfaCubit() : super(<Sepet>[]);

  var repo = YemeklerDaoRepository();

  Future<void> sepettekiUrunleriAl(String kullanici_adi) async {
    try {
      var sepetListesi = await repo.sepettekiUrunleriCek(kullanici_adi);
      if(sepetListesi.isNotEmpty){
        emit(sepetListesi);
      }else{
        print("Sepet boş geldi");
        emit([]);
      }

    } catch (e) {
      print("Sepet Boş Geldi");
      emit([]);
    }

  }

  Future<bool> sepettenUrunSil(int sepet_yemek_id, String kullanici_adi) async {
    try{
      await repo.sepetUrunSil(sepet_yemek_id, kullanici_adi);
      await sepettekiUrunleriAl(kullanici_adi);
      return true;
    }catch(e){
      print("Hata Oluştu: $e");
      return false;
    }

  }
}