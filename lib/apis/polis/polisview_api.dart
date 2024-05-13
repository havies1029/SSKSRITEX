import 'dart:convert';
import 'dart:typed_data';
import 'package:ecargo_app/common/app_data.dart';
import 'package:ecargo_app/models/polis/polis1crud_model.dart';
import 'package:ecargo_app/models/polis/polis4doc_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PolisViewAPI {
  
  final String _base = AppData.apiDomain;

  Future<Polis1CrudModel> getPolisViewAPI(String polis1Id) async {
    String urlGetListEndPoint =
      "${AppData.prefixEndPoint}/api/polis/polisview/read";

    //debugPrint("getPolisViewAPI");

    Polis1CrudModel returnData;
    Map<String, String> queryParams = {"polis1Id": polis1Id};
    var uri = AppData.uriHtpp(AppData.httpAuthority, urlGetListEndPoint, queryParams);
    final http.Response response =
        await http.get(uri, headers: <String, String>{
      'Content-Type': 'application/json; odata=verbos',
      'Accept': 'application/json; odata=verbos',
      'Authorization': 'Bearer ${AppData.userToken}'
    });
    //debugPrint(response.body);
    //debugPrint("response.statusCode : ${response.statusCode}");

    if (response.statusCode == 200) {
      returnData = Polis1CrudModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
    return returnData;
  }

  Future<Polis4DocModel> getPolisDoc(String polis4id) async {
    debugPrint("getPolis4Doc API");

    String urlGetPolisDocEndPoint =
      "${AppData.prefixEndPoint}/api/polis/polisview/getdoc";

    Polis4DocModel returnData;
    Map<String, String> queryParams = {"polis4id": polis4id};
    var uri = AppData.uriHtpp(AppData.httpAuthority, urlGetPolisDocEndPoint, queryParams);
    final http.Response response =
        await http.get(uri, headers: AppData.httpHeaders);
    //debugPrint(response.body);
    //debugPrint("response.statusCode : ${response.statusCode}");

    if (response.statusCode == 200) {

      returnData = Polis4DocModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
    return returnData;
  }

  Future<Uint8List> getPolisFile(String polis4id) async {
    String urlGetPolisFileEndPoint = "api/polis/polisview/getdoc/$polis4id";

    String urlGetPolisFileUrl = _base + urlGetPolisFileEndPoint;

    //debugPrint("urlGetPolisFileUrl : $urlGetPolisFileUrl");

    final client = http.Client();
    final request = await client.get(Uri.parse(urlGetPolisFileUrl),
        headers: AppData.httpHeaders);

    Uint8List bytes = request.bodyBytes;

    //debugPrint("request.statusCode : ${request.statusCode}");
    //debugPrint("request.bodyBytes : ${request.bodyBytes.length}");

    return bytes;
  }
}
