import 'dart:convert';
import 'package:ecargo_app/common/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ecargo_app/models/combobox/combocomodity_model.dart';

String _getComboComodityEndPoint =
    "${AppData.prefixEndPoint}/api/mcomoditycombobox/getlist";

Future<List<ComboComodity>> getComboComodityAPI(String filter) async {
  //debugPrint("getComboComodityAPI #01");
  //debugPrint(_getComboComodityEndPoint);  

  Map<String, String> queryParams = {"filter": filter};

  var uri =
      AppData.uriHtpp(AppData.httpAuthority, _getComboComodityEndPoint, queryParams);

  final http.Response response = await http.get(uri, headers: <String, String>{
    'Content-Type': 'application/json; odata=verbos',
    'Accept': 'application/json; odata=verbos',
    'Authorization': 'Bearer ${AppData.userToken}'
  });

  //debugPrint("getComboComodityAPI #02");
  //debugPrint(AppData.userToken);

  //debugPrint("response.statusCode : ${response.statusCode}");

  if (response.statusCode == 200) {
    //debugPrint("Berhasil get data propinsi via api #20");
    debugPrint(response.body);

    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    
    //debugPrint("Berhasil get data comodity via api #30");
    //debugPrint(parsed.toString());
    //debugPrint("Berhasil get data comodity via api #35");

    return parsed
        .map<ComboComodity>((json) => ComboComodity.fromJson(json))
        .toList();
  } else {
    //debugPrint("Gagal get data propinsi");

    //debugPrint(response.statusCode.toString());
    //throw Exception(json.decode(response.body));
    throw Exception("Failed to load data");
  }
}
