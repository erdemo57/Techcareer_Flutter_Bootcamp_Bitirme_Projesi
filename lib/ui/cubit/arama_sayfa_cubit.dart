import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/entity/arama.dart';
import 'package:flutter_bootcamp_bitirme_projesi/data/repo/arama_dao_repository.dart';

class AramaSayfaCubit extends Cubit<List<Arama>> {
  AramaSayfaCubit(): super(<Arama>[]);

  var arepo = AramaDaoRepository();

  Future<void> yemekleriYukle() async {

    var liste = await arepo.yemekleriYukle();
    emit(liste);
  }
  Future<void> ara(String aramaKelimesi) async {
    var liste = await arepo.ara(aramaKelimesi);
    emit(liste);
  }
}