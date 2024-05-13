import 'package:ecargo_app/apis/soaclient/dncncari_api.dart';
import 'package:ecargo_app/models/soaclient/dncncari_model.dart';

class DncnCariRepository {

	Future<List<DncnCariModel>> getDncnCari(String searchText, int hal) async {
		return await getDncnCariAPI(searchText, hal);
	}
}
