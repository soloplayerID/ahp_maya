// ignore_for_file: avoid_print

import 'package:ahp_maya/src/state/add_nilaiAwal_state.dart';

import '../model/add_nilaiAwal_model.dart';
import '../model/muridList_model.dart';
import '../resources/nilaiAwalApi.dart';

abstract class AddNilaiAwalAbstract {
  set view(AddNilaiAwalState view) {}
  void save(String nama, String ket) {}
  void getData() {}
  void addNisSiswa(String nis) {}
}

class AddNilaiAwalPresenter implements AddNilaiAwalAbstract {
  final AddNilaiAwalModel _addNilaiAwalModel = AddNilaiAwalModel();
  late AddNilaiAwalState _addNilaiAwalState;
  final NilaiAwalServices _nilaiAwalServices = NilaiAwalServices();

  @override
  void save(String nama, String ket) {
    _addNilaiAwalModel.isloading = true;
    _addNilaiAwalState.refreshData(_addNilaiAwalModel);

    Map<String, String> body = <String, String>{
      "nama": nama,
      "ket": ket,
    };
    print(body);
    _nilaiAwalServices.updateProfile(nama, ket).then((res) {
      _addNilaiAwalState.onSuccess(res.toString());
      print(res.toString());
      _addNilaiAwalModel.isloading = false;
      _addNilaiAwalState.refreshData(_addNilaiAwalModel);
    }).catchError((err) {
      _addNilaiAwalState.onError(err.toString());
      _addNilaiAwalModel.isloading = false;
      _addNilaiAwalState.refreshData(_addNilaiAwalModel);
    });
  }

  @override
  set view(AddNilaiAwalState view) {
    _addNilaiAwalState = view;
    _addNilaiAwalState.refreshData(_addNilaiAwalModel);
  }
  
  @override
  void getData() {
    _addNilaiAwalModel.isloading = true;
    _addNilaiAwalState.refreshData(_addNilaiAwalModel);
    _nilaiAwalServices.getDataMurid().then((value) {
      for(var element in value.data!) {
        _addNilaiAwalModel.santri.add(Santri(nis: element.nip.toString(), nama: element.nama.toString(), alamat: element.alamat.toString(), jk: element.jk.toString()));
      }
      _addNilaiAwalModel.isloading = false;
      _addNilaiAwalState.refreshData(_addNilaiAwalModel);
    }).catchError((err) {
      _addNilaiAwalState.onError(err.toString());
      _addNilaiAwalModel.isloading = false;
      _addNilaiAwalState.refreshData(_addNilaiAwalModel);
    });
  }
  
  @override
  void addNisSiswa(String nis) {
    
  }
}
