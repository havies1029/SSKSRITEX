import 'package:ecargo_app/apis/combobox/combojabatan_api.dart';
import 'package:ecargo_app/models/combobox/combojabatan_model.dart';

class ComboJabatanRepository {
  Future<List<ComboJabatan>> getComboJabatan() async {
    //debugPrint("ComboJabatanRepository -> getComboJabatan");
    return await getComboJabatanAPI();
  }
}
