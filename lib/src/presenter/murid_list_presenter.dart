// ignore_for_file: avoid_print

import 'package:ahp_maya/src/model/muridList_model.dart';
import '../resources/muridApi.dart';
import '../state/murid_list_state.dart';

abstract class MuridListPresenterAbstract {
  set view(SantriListState view) {}
  void getData() {}
  void deleteMurid(String nis) {}
}

class MuridListPresenter implements MuridListPresenterAbstract {
  final SantriListModels _santriListModel = SantriListModels();
  late SantriListState _santriListState;
  final MuridServices _muridServices = MuridServices();

  @override
  set view(SantriListState view) {
    _santriListState = view;
    _santriListState.refreshData(_santriListModel);
  }

  @override
  void getData() {
    _santriListModel.santri.clear();
    print('=== getData ===');
    _santriListModel.isloading = true;
    _santriListState.refreshData(_santriListModel);
    _muridServices.getData().then((value) {
      for (var element in value.data!) {
        _santriListModel.santri.add(Santri(
            nis: element.nip.toString(),
            nama: element.nama.toString(),
            alamat: element.alamat.toString(),
            jk: element.jk.toString()));
      }
      print('success');
      _santriListModel.isloading = false;
      _santriListState.refreshData(_santriListModel);
    }).catchError((error) {
      _santriListState.onError(error);
      _santriListModel.isloading = false;
      _santriListState.refreshData(_santriListModel);
    });
  }

  @override
  void deleteMurid(String nis) {
    _santriListModel.isloading = true;
    _santriListState.refreshData(_santriListModel);
    _muridServices.deleteProfile(nis).then((value) {
      _santriListState.onSuccess('berhasil delete');
      getData();
    }).catchError((error) {
      _santriListState.onError(error);
      _santriListModel.isloading = false;
      _santriListState.refreshData(_santriListModel);
    });
  }
}
