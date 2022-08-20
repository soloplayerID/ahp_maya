import '../model/kriteriaList_model.dart';

abstract class KriteriaListState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(KriteriaListModels santriListModel);
}
