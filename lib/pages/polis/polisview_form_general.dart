import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PolisViewFormGeneralPage extends StatelessWidget {
  final double cstPremi;
  final String insuredNama;
  final DateTime periodeAkhir;
  final DateTime periodeAwal;
  final String polisNo;
  final double tsi;
  final String cobNama;
  final String coverNo;
  final String curr;

  const PolisViewFormGeneralPage(
      {super.key,
      required this.cstPremi,
      required this.insuredNama,
      required this.periodeAkhir,
      required this.periodeAwal,
      required this.polisNo,
      required this.tsi,
      required this.cobNama,
      required this.coverNo,
      required this.curr});

  @override
  Widget build(BuildContext context){
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          //height: 285,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(5),
          child: Column(                
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text(insuredNama,
                  style: MyText.titleLarge(context)!.copyWith(
                      color: MyColors.grey_90, fontWeight: FontWeight.bold)),
              Text("($cobNama)",
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_80)),
              Container(height: 5),
              const Divider(color: MyColors.grey_100_, height: 15,),
              Container(height: 5),
              Text(
                  polisNo.isNotEmpty
                      ? "Policy No."
                      : "Cover Note No.",
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_60)),
              Container(height: 5),
              Text(polisNo.isNotEmpty ? polisNo : coverNo,
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_90)),
              Container(height: 10),
              Text("Period",
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_60)),
              Container(height: 5),
              Text(
                  "${DateFormat("dd-MM-yyyy").format(periodeAwal)} to ${DateFormat("dd-MM-yyyy").format(periodeAkhir)}",
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_90)),
              Container(height: 10),
              Text("Sum Insured",
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_60)),
              Container(height: 5),
              Text("$curr ${NumberFormat("#,###").format(tsi)}",
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_90)),
              Container(height: 10),
              Text("Premium",
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_60)),
              Container(height: 5),
              Text("$curr ${NumberFormat("#,###").format(cstPremi)}",
                  style: MyText.bodyLarge(context)!
                      .copyWith(color: MyColors.grey_90)),
          ]),
        ));
  }
  
}
