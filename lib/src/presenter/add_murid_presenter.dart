

// ignore_for_file: avoid_print

import '../model/add_murid_model.dart';
import '../resources/muridApi.dart';
import '../state/add_murid_state.dart';

abstract class AddMuridAbstract {
  set view(AddMuridState view) {}
  void save(String nis, String nama, String alamat, String jk) {}
}

class AddMuridPresenter implements AddMuridAbstract{
  final AddMuridModel _addMuridModel = AddMuridModel();
  late AddMuridState _addMuridState;
  final MuridServices _muridServices = MuridServices();


  @override
  void save(String nama, String nis, String alamat, String jk) {
    _addMuridModel.isloading = true;
    _addMuridState.refreshData(_addMuridModel);

    Map<String, String> body = <String, String>{
      "nama": nama,
      "nis": nis,
      "alamat":alamat,
      "jenis_kelamin":jk
    };
    print(body);
    _muridServices
        .updateProfile(nis,nama,alamat,jk).then((res) {
      _addMuridState.onSuccess(res.toString());
      print(res.toString());
      _addMuridModel.isloading = false;
      _addMuridState.refreshData(_addMuridModel);
    }).catchError((err) {
      _addMuridState.onError(err.toString());
      _addMuridModel.isloading = false;
      _addMuridState.refreshData(_addMuridModel);
    });
  }

  @override
  set view(AddMuridState view) {
    _addMuridState = view;
    _addMuridState.refreshData(_addMuridModel);
  }

}
