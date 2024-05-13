import 'dart:convert';
import 'package:ecargo_app/common/app_data.dart';
import 'package:http/http.dart' as http;
import 'package:ecargo_app/models/combobox/combopacking_model.dart';

String _getComboPackingEndPoint =
    "${AppData.prefixEndPoint}/api/mpackingcombobox/getlist";

Future<List<ComboPacking>> getComboPackingAPI(String filter) async {
  //debugPrint("getComboPackingAPI #01");
  //debugPrint(_getComboPackingEndPoint);  

  Map<String, String> queryParams = {"filter": filter};

  var uri =
      AppData.uriHtpp(AppData.httpAuthority, _getComboPackingEndPoint, queryParams);

  final http.Response response = await http.get(uri, headers: <String, String>{
    'Content-Type': 'application/json; odata=verbos',
    'Accept': 'application/json; odata=verbos',
    'Authorization': 'Bearer ${AppData.userToken}'
  });

  //debugPrint("getComboPackingAPI #02");
  //debugPrint(AppData.userToken);

  //debugPrint("response.statusCode : ${response.statusCode}");

  if (response.statusCode == 200) {
    //debugPrint("Berhasil get data propinsi via api #20");
    //debugPrint(response.body);

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    //debugPrint("Berhasil get data propinsi via api #30");

    return parsed
        .map<ComboPacking>((json) => ComboPacking.fromJson(json))
        .toList();
  } else {
    //debugPrint("Gagal get data propinsi");

    //debugPrint(response.statusCode.toString());
    //throw Exception(json.decode(response.body));
    throw Exception("Failed to load data");
  }
}

