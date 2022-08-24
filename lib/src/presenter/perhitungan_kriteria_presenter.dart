import 'package:ahp_maya/screen/perhitungan_kriteria.dart';
import 'package:ahp_maya/src/model/perhitungan_kriteria_model.dart';
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

  @override
  void getData() {
    print('mulai getData');
  }

  @override
  set view(PerhitunganKriteriaScreenState view) {
    _perhitunganKriteriaState = view;
    _perhitunganKriteriaState.refreshData(_perhitunganKriteriaModel);
  }
}
