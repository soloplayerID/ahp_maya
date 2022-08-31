import 'package:ahp_maya/src/model/perhitungan_alternatif_model.dart';
import 'package:ahp_maya/src/state/perhitungan_alternatif_state.dart';

import '../resources/analisaApi.dart';

abstract class PerhitunganAlternatifPresenterAbstract {
  set view(PerhitunganAlternatifState view) {}
  void getData() {}
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
    _analisaServices.getDataBobot().then((value) {
      _perhitunganAlternatifModel.bobotResponse = value;
      _perhitunganAlternatifModel.isloading = false;
      _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
      _perhitunganAlternatifState.onSuccess('Berhasil');
    }).catchError((error) {
      _perhitunganAlternatifModel.isloading = false;
      _perhitunganAlternatifState.refreshData(_perhitunganAlternatifModel);
      _perhitunganAlternatifState.onError(error.toString());
    });
  }
}
