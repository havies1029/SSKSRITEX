import 'package:ecargo_app/apis/combobox/combopropinsi_api.dart';
import 'package:ecargo_app/models/combobox/combopropinsi_model.dart';

class ComboPropinsiRepository {
  Future<List<ComboPropinsi>> getComboPropinsi(String filter) async {
    //debugPrint("ComboPropinsiRepository -> getComboPropinsi");
    return await getComboPropinsiAPI(filter);
  }
}
