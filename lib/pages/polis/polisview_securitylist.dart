import 'package:cool_table/cool_table.dart';
import 'package:ecargo_app/models/polis/polis3crud_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PolisViewSecurityListPage extends StatelessWidget {
  final String curr;
  final List<Polis3CrudModel> listSecurities;

  const PolisViewSecurityListPage({super.key, 
    required this.curr,
    required this.listSecurities});

  @override
  Widget build(BuildContext context) {
    return buildWTableBarang(listSecurities);
  }

  WTable buildWTableBarang(List<Polis3CrudModel> listItem) {
    List<WTR> listWTR = [];

    listWTR.add(buildWTRHeader(curr));
    for (Polis3CrudModel item in listItem) {
      listWTR.add(buildWTRRow(item));
    }

    return WTable(
        border: Border.all(color: Colors.black, width: 1),
        padding: EdgeInsets.zero,
        rows: listWTR);
  }

  WTR buildWTRHeader(String curr) {
    WTD col1 = const WTD(
        child: Text("Insurer",
            style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
        flex: 7);
    WTD col2 = const WTD(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text("Share",
                style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
            Text("(%)",
                style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
        flex: 4);

    return WTR(
        border: const Border(bottom: BorderSide(width: 2, color: Colors.blue)),
        children: [col1, col2]);
  }

  WTR buildWTRRow(Polis3CrudModel item) {
    String rekanNama = item.rekanNama;
    double sharePersen = item.sharePersen;

    WTD wtd1 = WTD(flex: 7, child: Text(rekanNama, style: const TextStyle(color: Colors.black,))) ;
    WTD wtd2 = WTD(
        child: Row(
          children: [
            const Spacer(),
            Text(NumberFormat("##0.00").format(sharePersen), style: const TextStyle(color: Colors.black,)),
          ],
        ),
        flex: 4);

    return WTR(children: [wtd1, wtd2]);
  }
}
