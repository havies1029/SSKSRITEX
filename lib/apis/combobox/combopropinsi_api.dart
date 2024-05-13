import 'dart:convert';
import 'package:ecargo_app/common/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:ecargo_app/models/combobox/combopropinsi_model.dart';

//final _base = AppData.apiDomain;
String _getComboPropinsiEndPoint = "${AppData.prefixEndPoint}/api/propinsicombobox/getlist";
//const _getComboPropinsiEndPoint = "/api/propinsicombobox/getlist";
//final _getComboPropinsiUrl = _base + _getComboPropinsiEndPoint;

Future<List<ComboPropinsi>> getComboPropinsiAPI(String filter) async {
  //debugPrint("getComboPropinsiAPI #01");
  debugPrint(_getComboPropinsiEndPoint);

  Map<String, String> queryParams = {
      "filter": filter
    };

  var uri =
        AppData.uriHtpp(AppData.httpAuthority, _getComboPropinsiEndPoint, queryParams);


  //debugPrint(uri.toString());

  final http.Response response =
      await http.get(uri, headers: <String, String>{
    'Content-Type': 'application/json; odata=verbos',
    'Accept': 'application/json; odata=verbos',
    'Authorization': 'Bearer ${AppData.userToken}'
  });

  //debugPrint("getComboPropinsiAPI #02");

  //debugPrint("response.statusCode : ${response.statusCode}");

if (response.statusCode == 200) {
      //debugPrint("Berhasil get data propinsi via api #20");
      //debugPrint(response.body);

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      //debugPrint("Berhasil get data propinsi via api #30");

      return parsed
          .map<ComboPropinsi>((json) => ComboPropinsi.fromJson(json))
          .toList();
    } else {
        debugPrint("Gagal get data propinsi");

      //debugPrint(response.statusCode.toString());
      throw Exception(json.decode(response.body));
      //throw Exception("Failed to load data");
    }
}


Future<List<String>> getComboPropinsiAPI2(String filter) async {
  //debugPrint("getComboPropinsiAPI #01");

  Map<String, String> queryParams = {
      "filter": filter
    };

  var uri =
        AppData.uriHtpp(AppData.httpAuthority, _getComboPropinsiEndPoint, queryParams);


  final http.Response response =
      await http.get(uri, headers: <String, String>{
    'Content-Type': 'application/json; odata=verbos',
    'Accept': 'application/json; odata=verbos',
    'Authorization': 'Bearer ${AppData.userToken}'
  });

  //debugPrint("getComboPropinsiAPI #02");

  //debugPrint("response.statusCode : ${response.statusCode}");

if (response.statusCode == 200) {
      //debugPrint("Berhasil get data propinsi via api #20");
      //debugPrint(response.body);

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      //debugPrint("Berhasil get data propinsi via api #30");

      return parsed
          .map<ComboPropinsi>((json) => ComboPropinsi.fromJson(json))
          .toList();
    } else {
        //debugPrint("Gagal get data propinsi");

      //debugPrint(response.statusCode.toString());
      //throw Exception(json.decode(response.body));
      throw Exception("Failed to load data");
    }
}