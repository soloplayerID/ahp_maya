import 'package:ahp_maya/src/model/hasil_model.dart';
import 'package:ahp_maya/src/state/hasil_state.dart';

import '../resources/hasilApi.dart';

abstract class HasilPresenterAbstract {
  set view(HasilState view) {}
  void getData() {}
  void getKriteria() {}
  void getAhp() {}
}

class HasilPresenter implements HasilPresenterAbstract {
  final HasilModels _hasilModels = HasilModels();
  late HasilState _hasilState;
  final HasilServices _hasilServices = HasilServices();

  @override
  void getData() {
    _hasilModels.isloading = true;
    _hasilState.refreshData(_hasilModels);
    _hasilServices.getDataRank().then((value) {
      for (var element in value.data!) {
        value.data!.sort((a, b) => a.ranking!.compareTo(b.ranking!));
        _hasilModels.rank.add(Rank(
            nama: element.nama.toString(),
            nilai: element.nilai.toString(),
            ranking: element.ranking.toString()));
      }
      _hasilModels.isloading = false;
      _hasilState.refreshData(_hasilModels);
    }).catchError((error) {
      _hasilState.onError(error);
      _hasilModels.isloading = false;
      _hasilState.refreshData(_hasilModels);
    });
  }

  @override
  set view(HasilState view) {
    _hasilState = view;
    _hasilState.refreshData(_hasilModels);
  }

  @override
  void getKriteria() {
    _hasilModels.isloading = true;
    _hasilState.refreshData(_hasilModels);
    _hasilServices.getDataKriteria().then((value) {
      for (var element in value.data!) {
        _hasilModels.kriteriaHasil.add(KriteriaHasil(
            idKriteria: element.idKriteria.toString(),
            nama: element.nama.toString(),
            ket: element.ket.toString()));
      }
      _hasilModels.isloading = false;
      _hasilState.refreshData(_hasilModels);
    }).catchError((error) {
      _hasilState.onError(error);
      _hasilModels.isloading = false;
      _hasilState.refreshData(_hasilModels);
    });
  }

  @override
  void getAhp() {
    _hasilModels.isloading = true;
    _hasilState.refreshData(_hasilModels);
    _hasilServices.getDataAhp().then((value) {
      for (var element in value.data!) {
        _hasilModels.ahpModel.add(AhpModel(
            id: element.idAhp!,
            namaHasil: element.nama.toString(),
            kriteria: element.kriteria.toString(),
            prioritas: element.prioritas.toString()));
      }
      _hasilModels.isloading = false;
      _hasilState.refreshData(_hasilModels);
    }).catchError((error) {
      _hasilState.onError(error);
      _hasilModels.isloading = false;
      _hasilState.refreshData(_hasilModels);
    });
  }
}
