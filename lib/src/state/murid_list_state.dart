
import 'package:ahp_maya/src/model/muridList_model.dart';

abstract class SantriListState {
  void onSuccess(String success);
  void onError(String error);
  void refreshData(SantriListModels santriListModel);
}
