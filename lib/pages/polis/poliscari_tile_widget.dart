import 'package:ecargo_app/pages/polis/polisview_main.dart';
import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PolisCariTileWidget extends StatelessWidget {
  final double cstPremi;
  final String insuredNama;
  final DateTime periodeAkhir;
  final DateTime periodeAwal;
  final String? placing1Id;
  final DateTime? polisIssued;
  final String polisNo;
  final String polis1Id;
  final double tsi;
  final String cobNama;
  final String coverNo;
  final String curr;

  const PolisCariTileWidget(
      {super.key,
      required this.cstPremi,
      required this.insuredNama,
      required this.periodeAkhir,
      required this.periodeAwal,
      required this.placing1Id,
      this.polisIssued,
      required this.polisNo,
      required this.polis1Id,
      required this.tsi,
      required this.cobNama,
      required this.coverNo,
      required this.curr});

  @override
  Widget build(BuildContext context) {
    debugPrint("PolisCariTileWidget -> build");

    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          //height: 275,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(insuredNama,
                    style: MyText.bodyMedium(context)!.copyWith(
                        color: MyColors.grey_80, fontWeight: FontWeight.bold)),
                Text("($cobNama)",
                    style: MyText.bodySmall(context)!
                        .copyWith(color: MyColors.grey_80)),
              ]),
              Container(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 10,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              polisNo.isNotEmpty
                                  ? "Policy No."
                                  : "Cover Note No.",
                              style: MyText.bodyMedium(context)!
                                  .copyWith(color: MyColors.grey_40)),
                          Container(height: 5),
                          Text(polisNo.isNotEmpty ? polisNo : coverNo,
                              style: MyText.bodyMedium(context)!
                                  .copyWith(color: MyColors.grey_80)),
                          Container(height: 10),
                          Text("Period",
                              style: MyText.bodyMedium(context)!
                                  .copyWith(color: MyColors.grey_40)),
                          Container(height: 5),
                          Text(
                              "${DateFormat("dd-MM-yyyy").format(periodeAwal)} to ${DateFormat("dd-MM-yyyy").format(periodeAkhir)}",
                              style: MyText.bodyMedium(context)!
                                  .copyWith(color: MyColors.grey_80)),
                          Container(height: 10),
                          Text("Sum Insured",
                              style: MyText.bodyMedium(context)!
                                  .copyWith(color: MyColors.grey_40)),
                          Container(height: 5),
                          Text("$curr ${NumberFormat("#,###").format(tsi)}",
                              style: MyText.bodyMedium(context)!
                                  .copyWith(color: MyColors.grey_80)),
                          Container(height: 10),
                          Text("Premium",
                              style: MyText.bodyMedium(context)!
                                  .copyWith(color: MyColors.grey_40)),
                          Container(height: 5),
                          Text(
                              "$curr ${NumberFormat("#,###").format(cstPremi)}",
                              style: MyText.bodyMedium(context)!
                                  .copyWith(color: MyColors.grey_80)),
                        ]),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            //return const AccordionPage();
                            return PolisViewMainPage(polis1Id: polis1Id);
                          }),
                        );

                        /*
                        BlocProvider.of<HomeBloc>(context)
                            .add(PolisViewPageActiveEvent(polis1Id: polis1Id));
                            */
                      },
                      child: const Icon(
                        Icons.keyboard_double_arrow_right_rounded,
                        size: 50.0,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
