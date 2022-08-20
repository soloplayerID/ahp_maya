// ignore_for_file: avoid_print

import '../model/kriteriaList_model.dart';
import '../resources/kriteriaApi.dart';
import '../state/kriteria_list_state.dart';

abstract class KriteriaListPresenterAbstract {
  set view(KriteriaListState view) {}
  void getData() {}
}

class KriteriaListPresenter implements KriteriaListPresenterAbstract {
  final KriteriaListModels _kriteria = KriteriaListModels();
  late KriteriaListState _kriteriaListState;
  final KriteriaServices _muridServices = KriteriaServices();

  @override
  set view(KriteriaListState view) {
    _kriteriaListState = view;
    _kriteriaListState.refreshData(_kriteria);
  }

  @override
  void getData() {
    print('==');
    _kriteria.isloading = true;
    _kriteriaListState.refreshData(_kriteria);
    _muridServices.getData().then((value) {
      for (var element in value.data!) {
        _kriteria.kriteria.add(Kriteria(
            idKriteria: element.idKriteria.toString(),
            nama: element.nama.toString(),
            ket: element.ket.toString()));
      }
      _kriteria.isloading = false;
      _kriteriaListState.refreshData(_kriteria);
    }).catchError((error) {
      _kriteriaListState.onError(error);
      _kriteria.isloading = false;
      _kriteriaListState.refreshData(_kriteria);
    });
  }
}
