// ignore_for_file: avoid_print

import '../model/nilai_awal.dart';
import '../resources/nilaiAwalApi.dart';
import '../state/nilai_awal_list_state.dart';

abstract class NilaiAwalListPresenterAbstract {
  set view(NilaiAwalListState view) {}
  void getData() {}
}

class NilaiAwalListPresenter implements NilaiAwalListPresenterAbstract {
  final NilaiAwalListModels _nilaiAwalListModels = NilaiAwalListModels();
  late NilaiAwalListState _nilaiAwalListState;
  final NilaiAwalServices _nilaiAwalServices = NilaiAwalServices();

  @override
  set view(NilaiAwalListState view) {
    _nilaiAwalListState = view;
    _nilaiAwalListState.refreshData(_nilaiAwalListModels);
  }

  @override
  void getData() {
    print('==');
    _nilaiAwalListModels.isloading = true;
    _nilaiAwalListState.refreshData(_nilaiAwalListModels);
    _nilaiAwalServices.getData().then((value) {
      for (var element in value.data!) {
        _nilaiAwalListModels.nilaiAwal.add(NilaiAwal(
            idNilaiAwal: element.idNilaiAwal.toString(),
            nama: element.nama.toString(),
            keterangan: element.keterangan.toString(),
            nilai: element.nilai.toString(),
            periode: element.periode.toString()
            ));
      }
      _nilaiAwalListModels.isloading = false;
      _nilaiAwalListState.refreshData(_nilaiAwalListModels);
    }).catchError((error) {
      _nilaiAwalListState.onError(error);
      _nilaiAwalListModels.isloading = true;
      _nilaiAwalListState.refreshData(_nilaiAwalListModels);
    });
  }
}
