import '../model/add_kriteria.dart';

abstract class AddKriteriaState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(AddKriteriaModel addKriteriaModel);
}
