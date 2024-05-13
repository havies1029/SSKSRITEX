import 'package:ecargo_app/apis/combobox/combocomodity_api.dart';
import 'package:ecargo_app/models/combobox/combocomodity_model.dart';

class ComboComodityRepository {
  Future<List<ComboComodity>> getComboComodity(String filter) async {
    //debugPrint("ComboComodityRepository -> getComboComodity");
    return await getComboComodityAPI(filter);
  }
}