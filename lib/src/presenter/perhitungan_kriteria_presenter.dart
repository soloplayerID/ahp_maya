import 'package:ahp_maya/screen/perhitungan_kriteria.dart';
import 'package:ahp_maya/src/model/perhitungan_kriteria_model.dart';
import 'package:ahp_maya/src/resources/analisaApi.dart';
import 'package:ahp_maya/src/state/perhitungan_Kriteria_state.dart';

abstract class PerhitunganKriteriaPresenterAbstract {
  set view(PerhitunganKriteriaScreenState view) {}
  void getData() {}
}

class PerhitunganKriteriaPresenter
    implements PerhitunganKriteriaPresenterAbstract {
  final PerhitunganKriteriaModel _perhitunganKriteriaModel =
      PerhitunganKriteriaModel();
  late PerhitunganKriteriaState _perhitunganKriteriaState;
  final AnalisaServices _analisaServices = AnalisaServices();

  @override
  void getData() {
    print('mulai getDataBobot');
    _perhitunganKriteriaModel.isloading = true;
    _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
    _analisaServices.getDataBobot().then((value) {
      // for (var element in value.data!) {
      //   _perhitunganKriteriaModel.bobot.add(Bobot(
      //       bobot: element.bobot.toString(), nama: element.nama.toString()));
      // }
      _perhitunganKriteriaModel.bobotResponse = value;
      _perhitunganKriteriaModel.isloading = false;
      _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
      print('sukses getDataBobot');
      _perhitunganKriteriaState.onSuccess('success getBobot');
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
}
