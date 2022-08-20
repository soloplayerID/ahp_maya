// ignore_for_file: avoid_print

import '../model/add_kriteria.dart';
import '../resources/kriteriaApi.dart';
import '../state/add_kriteria_state.dart';

abstract class AddKriteriaAbstract {
  set view(AddKriteriaState view) {}
  void save(String nama, String ket) {}
}

class AddKriteriaPresenter implements AddKriteriaAbstract {
  final AddKriteriaModel _addKriteriaModel = AddKriteriaModel();
  late AddKriteriaState _addKriteriaState;
  final KriteriaServices _kriteriaServices = KriteriaServices();

  @override
  void save(String nama, String ket) {
    _addKriteriaModel.isloading = true;
    _addKriteriaState.refreshData(_addKriteriaModel);

    Map<String, String> body = <String, String>{
      "nama": nama,
      "ket": ket,
    };
    print(body);
    _kriteriaServices.updateProfile(nama, ket).then((res) {
      _addKriteriaState.onSuccess(res.toString());
      print(res.toString());
      _addKriteriaModel.isloading = false;
      _addKriteriaState.refreshData(_addKriteriaModel);
    }).catchError((err) {
      _addKriteriaState.onError(err.toString());
      _addKriteriaModel.isloading = false;
      _addKriteriaState.refreshData(_addKriteriaModel);
    });
  }

  @override
  set view(AddKriteriaState view) {
    _addKriteriaState = view;
    _addKriteriaState.refreshData(_addKriteriaModel);
  }
}
