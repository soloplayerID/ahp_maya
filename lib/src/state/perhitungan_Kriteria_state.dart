// ignore_for_file: file_names

import '../model/perhitungan_kriteria_model.dart';

abstract class PerhitunganKriteriaState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(PerhitunganKriteriaModel perhitunganKriteriaModel);
}
