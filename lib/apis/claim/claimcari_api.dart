import 'dart:convert';
import 'package:ecargo_app/common/app_data.dart';
import 'package:http/http.dart' as http;
import 'package:ecargo_app/models/claim/claimcari_model.dart';

String urlGetListEndPoint =
    "${AppData.prefixEndPoint}/api/claim/claimcari/getlist";

Future<List<ClaimCariModel>> getClaimCariAPI(String searchText, int hal) async {
  Map<String, String> queryParams = {
    "searchText": searchText,
    "hal": hal.toString()
  };
  var uri = AppData.uriHtpp(AppData.httpAuthority, urlGetListEndPoint, queryParams);

  final http.Response response = await http.get(uri, headers: <String, String>{
    'Content-Type': 'application/json; odata=verbos',
    'Accept': 'application/json; odata=verbos',
    'Authorization': 'Bearer ${AppData.userToken}'
  });

  //debugPrint("getClaimCariAPI -> response.statusCode : ${response.statusCode}");
  //debugPrint(response.body);

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

/*
    try {
      json.decode(response.body).cast<Map<String, dynamic>>();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      debugPrint("decode tidak error.");
    }
  */

    return parsed
        .map<ClaimCariModel>((json) => ClaimCariModel.fromJson(json))
        .toList();
  } else {
    throw Exception("Failed to load data");
  }
}
