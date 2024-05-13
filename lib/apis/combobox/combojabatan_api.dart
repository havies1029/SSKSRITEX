import 'dart:convert';
import 'package:ecargo_app/common/app_data.dart';
import 'package:http/http.dart' as http;
import 'package:ecargo_app/models/combobox/combojabatan_model.dart';

//final _base = AppData.apiDomain;
//const _getComboJabatanEndPoint = "/BGBAPI/api/jabatancombobox/getlist";
String _getComboJabatanEndPoint = "${AppData.prefixEndPoint}/api/jabatancombobox/getlist";

Future<List<ComboJabatan>> getComboJabatanAPI() async {
  //debugPrint("getComboJabatanAPI #01");

  var uri =
        AppData.uriHtpp(AppData.httpAuthority, _getComboJabatanEndPoint);


  final http.Response response =
      await http.get(uri, headers: <String, String>{
    'Content-Type': 'application/json; odata=verbos',
    'Accept': 'application/json; odata=verbos',
    'Authorization': 'Bearer ${AppData.userToken}'
  });

  //debugPrint("getComboJabatanAPI #02");

  //debugPrint("response.statusCode : ${response.statusCode}");

if (response.statusCode == 200) {
      //debugPrint("Berhasil get data jabatan via api #20");
      //debugPrint(response.body);

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      //debugPrint("Berhasil get data propinsi via api #30");

      return parsed
          .map<ComboJabatan>((json) => ComboJabatan.fromJson(json))
          .toList();
    } else {
        //debugPrint("Gagal get data jabatan");

      //debugPrint(response.statusCode.toString());
      //throw Exception(json.decode(response.body));
      throw Exception("Failed to load data");
    }
}
