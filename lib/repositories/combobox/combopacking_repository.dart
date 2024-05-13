import 'package:ecargo_app/apis/combobox/combopacking_api.dart';
import 'package:ecargo_app/models/combobox/combopacking_model.dart';

class ComboPackingRepository {
  Future<List<ComboPacking>> getComboPacking(String filter) async {
    //debugPrint("ComboPackingRepository -> getComboPacking");
    return await getComboPackingAPI(filter);
  }
}