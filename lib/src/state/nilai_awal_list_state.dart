import '../model/nilai_awal.dart';

abstract class NilaiAwalListState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(NilaiAwalListModels santriListModel);
}
