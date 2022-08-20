// ignore_for_file: file_names

import '../model/add_nilaiAwal_model.dart';

abstract class AddNilaiAwalState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(AddNilaiAwalModel addNilaiAwalModel);
}
