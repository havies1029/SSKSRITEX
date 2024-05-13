import 'package:ecargo_app/models/polis/endors1crud_model.dart';
import 'package:ecargo_app/pages/polis/polisview_endors_changes.dart';
import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PolisViewEndorsPage extends StatelessWidget {
  final String curr;
  final List<Endors1CrudModel>? listEndors;

  const PolisViewEndorsPage({super.key, required this.curr, this.listEndors});

  @override
  Widget build(BuildContext context) {
    List<Widget> listCard = [];
    int i = 0;
    for (Endors1CrudModel endors1 in listEndors!) {
      i++;
      listCard.add(buildCardObject(context, endors1, i));
      listCard.add(Container(height: 10));
    }
    Column col = Column(
      children: listCard,
    );

    return col;
  }

  Widget buildCardObject(
      BuildContext context, Endors1CrudModel endors1, int urutan) {
    return Card(
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 1),
        elevation: 2,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Container(
          //height: 220,
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(5),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Endorsement No.",
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_60)),
            Container(height: 5),
            Text(endors1.endors1Id,
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_90)),
            Container(height: 10),
            Text("Date",
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_60)),
            Container(height: 5),
            Text(DateFormat("dd-MM-yyyy").format(endors1.endorsTgl),
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_90)),
            Container(height: 10),
            Text("Endorsed Premium",
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_60)),
            Container(height: 5),
            Text("$curr ${NumberFormat("#,###").format(endors1.cstPremi)}",
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_90)),
            Container(height: 10),
            TextButton(
              onPressed: () async {
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32))),
                    context: context,
                    builder: (BuildContext context) {
                      return PolisViewEndorsChangesWidget(listChanges: endors1.listChanges!);
                    });
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.red,
                  elevation: 1,
                  backgroundColor: Colors.amber),
              child: const Text(
                "click here to show the changes",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
            )
          ]),
        ));
  }
}
