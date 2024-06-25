import 'package:ecargo_app/models/user/user_model.dart';

class AppData {
  static String userName = "";
  static String userid = "";
  static String userCabang = "";
  static String userToken = "";
  static int chatRefresh = 10;
  static bool kIsWeb = false;
  static User user = User();
  static bool useSSL = true;
  static var uriHtpp = useSSL ? Uri.https : Uri.http;


  static String apiDomain = "http://10.0.2.2/JPSAgencyAPI/";
  static String prefixEndPoint = "/JPSAgencyAPI";
  static String httpAuthority = "10.0.2.2";

/*
  static String apiDomain =
      "http${useSSL ? "s" : ""}://jpsagencyapi.smartsoft-id.com/";
  static String prefixEndPoint = "";
  static String httpAuthority = "jpsagencyapi.smartsoft-id.com";
*/

  static Map<String, String> httpHeaders = <String, String>{
    'Content-Type': 'application/json; odata=verbos',
    'Accept': 'application/json; odata=verbos',
    'Authorization': 'Bearer ${AppData.userToken}'
  };
}
