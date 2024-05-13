import 'package:ecargo_app/apis/combobox/comboconveyby_api.dart';
import 'package:ecargo_app/models/combobox/comboconveyby_model.dart';

class ComboConveyByRepository {

	Future<List<ComboConveyByModel>> getComboConveyBy(String filter) async {
		return await getComboConveyByAPI(filter);
	}
}
