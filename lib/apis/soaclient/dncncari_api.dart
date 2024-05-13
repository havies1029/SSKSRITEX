import 'dart:convert';
import 'package:ecargo_app/common/app_data.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ecargo_app/models/soaclient/dncncari_model.dart';

String urlGetListEndPoint =
    "${AppData.prefixEndPoint}/api/soaclient/soacari/getlist";

Future<List<DncnCariModel>> getDncnCariAPI(String searchText, int hal) async {
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

  debugPrint("getDncnCariAPI"); 

  if (response.statusCode == 200) {

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    return parsed
        .map<DncnCariModel>((json) => DncnCariModel.fromJson(json))
        .toList();
  } else {
    throw Exception("Failed to load data");
  }
}
