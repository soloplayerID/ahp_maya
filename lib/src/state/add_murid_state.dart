import '../model/add_murid_model.dart';

abstract class AddMuridState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(AddMuridModel addMuridModel);
}
