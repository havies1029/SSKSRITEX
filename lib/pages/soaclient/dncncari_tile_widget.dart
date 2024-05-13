import 'package:flutter/material.dart';
import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:intl/intl.dart';

class DncnCariTileWidget extends StatelessWidget {
  final String coverNo;
  final String curr;
  final DateTime dueDate;
  final String endors1Id;
  final String insuredName;
  final double invAmount;
  final String inv1Id;
  final String polisNo;
  final String invType;

  const DncnCariTileWidget(
      {super.key,
      required this.coverNo,
      required this.curr,
      required this.dueDate,
      required this.endors1Id,
      required this.insuredName,
      required this.invAmount,
      required this.inv1Id,
      required this.polisNo,
      required this.invType});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(15),
          child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Text(invType == "DN"?"DN #": "CN #",
                    style: MyText.bodyLarge(context)!
                        .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text(inv1Id,
                      style: MyText.bodyLarge(context)!
                          .copyWith(color: MyColors.grey_80)),
                  Container(height: 10),

                  Text(endors1Id.isEmpty?(polisNo.isEmpty?"Cover Note #":"Policy No #"):"Endorsement #",
                      style: MyText.bodyLarge(context)!
                          .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text(endors1Id.isEmpty?(polisNo.isEmpty?coverNo:polisNo):endors1Id,
                      style: MyText.bodyLarge(context)!
                          .copyWith(color: MyColors.grey_80)),
                  Container(height: 10),

                  Text("Insured Name",
                    style: MyText.bodyLarge(context)!
                        .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text(insuredName,
                      style: MyText.bodyLarge(context)!
                          .copyWith(color: MyColors.grey_80)),
                  Container(height: 10),

                  Text("Due Date",
                      style: MyText.bodyLarge(context)!
                          .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text(DateFormat("dd-MM-yyyy").format(dueDate),
                      style: MyText.bodyLarge(context)!
                          .copyWith(color: MyColors.grey_80)),
                  Container(height: 10),

                  Text("Amount",
                      style: MyText.bodyLarge(context)!
                          .copyWith(color: MyColors.grey_40)),
                  Container(height: 5),
                  Text('$curr ${NumberFormat("#,##0").format(invAmount)}',
                      style: MyText.bodyLarge(context)!
                          .copyWith(color: MyColors.grey_80)),
                  Container(height: 10),
            
          ]),
        ));
  }
}
