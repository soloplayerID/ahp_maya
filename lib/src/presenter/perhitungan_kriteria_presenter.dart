// ignore_for_file: avoid_print

import 'package:ahp_maya/screen/perhitungan_kriteria.dart';
import 'package:ahp_maya/src/model/perhitungan_kriteria_model.dart';
import 'package:ahp_maya/src/resources/analisaApi.dart';
import 'package:ahp_maya/src/state/perhitungan_Kriteria_state.dart';

abstract class PerhitunganKriteriaPresenterAbstract {
  set view(PerhitunganKriteriaScreenState view) {}
  void getData() {}
  void jawab(int index) {}
  void submit() {}
}

class PerhitunganKriteriaPresenter
    implements PerhitunganKriteriaPresenterAbstract {
  final PerhitunganKriteriaModel _perhitunganKriteriaModel =
      PerhitunganKriteriaModel();
  late PerhitunganKriteriaState _perhitunganKriteriaState;
  final AnalisaServices _analisaServices = AnalisaServices();

  @override
  void getData() {
    print('=== mulai getDataBobot ===');
    _perhitunganKriteriaModel.isloading = true;
    _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
    _analisaServices.getDataBobot().then((values) {
      // for (var element in value.data!) {
      //   _perhitunganKriteriaModel.bobot.add(Bobot(
      //       bobot: element.bobot.toString(), nama: element.nama.toString()));
      // }
      _perhitunganKriteriaModel.bobotResponse = values;
      _analisaServices.getDataJawaban().then((value) {
        print('=== berhasil getJawaban ===');
        _perhitunganKriteriaModel.kriteriaJawaban = value;
        _perhitunganKriteriaModel.isloading = false;
        _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
        _perhitunganKriteriaState.onSuccess('success getBobot');
      }).catchError((error) {
        _perhitunganKriteriaState.onError(error);
        _perhitunganKriteriaModel.isloading = false;
        _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
      });
    }).catchError((error) {
      _perhitunganKriteriaState.onError(error);
      _perhitunganKriteriaModel.isloading = false;
      _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
    });
  }

  @override
  set view(PerhitunganKriteriaScreenState view) {
    _perhitunganKriteriaState = view;
    _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
  }

  @override
  void jawab(int index) {
    int totalSoal = _perhitunganKriteriaModel.kriteriaJawaban.data!.length;
    if ((_perhitunganKriteriaModel.currentIndex + 1) < totalSoal) {
      _perhitunganKriteriaModel.currentIndex++;
      _perhitunganKriteriaModel.jawabanSelected.clear();
    } else {
      _perhitunganKriteriaModel.kumpulkan = true;
    }
    _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
  }

  @override
  void submit() async {
    _perhitunganKriteriaModel.isloading = true;
    _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
    _analisaServices.submitKriteria(_perhitunganKriteriaModel).then((value) {
      print(value);
      _perhitunganKriteriaModel.isloading = false;
      _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
      _perhitunganKriteriaState.onFinish('berhasil');
    }).catchError((error) {
      _perhitunganKriteriaState.onError(error);
      _perhitunganKriteriaModel.isloading = false;
      _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
    });
  }
}
