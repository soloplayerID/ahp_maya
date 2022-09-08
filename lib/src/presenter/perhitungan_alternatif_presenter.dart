import 'package:ahp_maya/src/model/kriteriaList_model.dart';
import 'package:ahp_maya/src/model/perhitungan_alternatif_model.dart';
import 'package:ahp_maya/src/state/perhitungan_alternatif_state.dart';

import '../resources/analisaApi.dart';

abstract class PerhitunganAlternatifPresenterAbstract {
  set view(PerhitunganAlternatifState view) {}
  void getData() {}
  void getDataKriteria() {}
  void addKriteriaId(String idKriteria) {}
  void jawab(int index) {}
  void submit() {}
}

class PerhitunganAlternatifPresenter
    implements PerhitunganAlternatifPresenterAbstract {
  final PerhitunganAlternatifModel _perhitunganAlternatifModel =
      PerhitunganAlternatifModel();
  late PerhitunganAlternatifState _perhitunganAlternatifState;
  final AnalisaServices _analisaServices = AnalisaServices();

  @override
  set view(PerhitunganAlternatifState view) {
    _perhitunganAlternatifState = view;
    _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
  }

  @override
  void getData() {
    _perhitunganAlternatifModel.isloading = true;
    _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
    _analisaServices.getDataBobot().then((values) {
      _perhitunganAlternatifModel.bobotResponse = values;
      _analisaServices.getDataJawabanAlternatif().then((value) {
        print('=== berhasil getJawaban ===');
        _perhitunganAlternatifModel.alternatifJawaban = value;
        _perhitunganAlternatifModel.isloading = false;
        _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
        _perhitunganAlternatifState.onSuccess('success getBobot');
      }).catchError((error) {
        _perhitunganAlternatifState.onError(error);
        _perhitunganAlternatifModel.isloading = false;
        _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
      });
    }).catchError((error) {
      _perhitunganAlternatifModel.isloading = false;
      _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
      _perhitunganAlternatifState.onError(error.toString());
    });
  }

  @override
  void getDataKriteria() {
    _perhitunganAlternatifModel.isloading = true;
    _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
    _analisaServices.getDataKriteria().then((value) {
      for (var element in value.data!) {
        _perhitunganAlternatifModel.kriteria.add(Kriteria(
            idKriteria: element.idKriteria.toString(),
            nama: element.nama.toString(),
            ket: element.ket.toString()));
      }
      print('=== success get data Kriteria ===');
      _perhitunganAlternatifModel.isloading = false;
      _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
    }).catchError((err) {
      _perhitunganAlternatifState.onError(err.toString());
      _perhitunganAlternatifModel.isloading = false;
      _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
    });
  }

  @override
  void jawab(int index) {
    int totalSoal = _perhitunganAlternatifModel.alternatifJawaban.data!.length;
    if ((_perhitunganAlternatifModel.currentIndex + 1) < totalSoal) {
      _perhitunganAlternatifModel.currentIndex++;
      _perhitunganAlternatifModel.jawabanSelected.clear();
    } else {
      _perhitunganAlternatifModel.kumpulkan = true;
    }
    _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
  }

  @override
  void submit() {
    _perhitunganAlternatifModel.isloading = true;
    _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
    _analisaServices
        .submitAlternatif(_perhitunganAlternatifModel)
        .then((value) {
      print(value);
      _perhitunganAlternatifModel.isloading = false;
      _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
      _perhitunganAlternatifState.onFinish('berhasil');
    }).catchError((error) {
      _perhitunganAlternatifModel.isloading = false;
      _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
    });
  }

  @override
  void addKriteriaId(String idKriteria) {
    _perhitunganAlternatifModel.isloading = true;
    _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
    print('== Kriteria Selected ==');
    _perhitunganAlternatifModel.kriteriaSelected = idKriteria;
    _perhitunganAlternatifModel.isloading = false;
    _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
  }
}
