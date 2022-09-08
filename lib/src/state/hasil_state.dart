import '../model/hasil_model.dart';

abstract class HasilState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(HasilModels hasilModels);
}
