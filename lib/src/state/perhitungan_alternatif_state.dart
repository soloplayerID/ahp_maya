// ignore_for_file: file_names

import '../model/perhitungan_alternatif_model.dart';

abstract class PerhitunganAlternatifState {
  void onSuccess(String success);
  void onFinish(String success);
  void onError(String error);
  void refreshData(PerhitunganAlternatifModel perhitunganAlternatifModel);
}
