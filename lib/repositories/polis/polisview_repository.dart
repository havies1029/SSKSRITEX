import 'dart:typed_data';

import 'package:ecargo_app/apis/polis/polisview_api.dart';
import 'package:ecargo_app/models/polis/polis1crud_model.dart';
import 'package:ecargo_app/models/polis/polis4doc_model.dart';
import 'package:flutter/material.dart';

class PolisViewRepository {
  Future<Polis1CrudModel> getPolisView(String polis1Id) async {
    debugPrint("PolisViewRepository");

    PolisViewAPI api = PolisViewAPI();
    return await api.getPolisViewAPI(polis1Id);
  }

  Future<Uint8List> getPolisFile(String polis4id) async {
    PolisViewAPI api = PolisViewAPI();
    return await api.getPolisFile(polis4id);
  }

  Future<Polis4DocModel> getPolisDoc(String polis4id) async {
    PolisViewAPI api = PolisViewAPI();
    return await api.getPolisDoc(polis4id);
  }
}
