import 'package:ecargo_app/apis/polis/poliscari_api.dart';
import 'package:ecargo_app/models/polis/poliscari_model.dart';

class PolisCariRepository {
  Future<List<PolisCariModel>> getPolisCari(String searchText, int hal) async {
    //debugPrint("PolisCariRepository -> getPolisCari");
    PolisCariAPI api = PolisCariAPI();
    List<PolisCariModel> list = await api.getPolisCariAPI(searchText, hal);
    //debugPrint("list count : ${list.length}");
    return list;
  }
}
