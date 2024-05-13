import 'package:ecargo_app/apis/claim/claimcari_api.dart';
import 'package:ecargo_app/models/claim/claimcari_model.dart';
import 'package:flutter/material.dart';

class ClaimCariRepository {
  Future<List<ClaimCariModel>> getClaimCari(String searchText, int hal) async {
    debugPrint("ClaimCariRepository -> getClaimCari");
    
    /*
    try {
      List<ClaimCariModel> list2 = await getClaimCariAPI(searchText, hal);      
      debugPrint("list count : ${list2.length}");
    } catch (e) {
      debugPrint(e.toString());
    } 
    */
    List<ClaimCariModel> list = await getClaimCariAPI(searchText, hal);
    
    return list;
  }
}
