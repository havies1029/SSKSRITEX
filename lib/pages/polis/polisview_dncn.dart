import 'package:ecargo_app/models/polis/dncn_model.dart';
import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class PolisViewDnCNPage extends StatelessWidget {
  final String polis1Id;
  final String curr;
  final List<DnCnModel>? listDnCn;

  const PolisViewDnCNPage(
      {super.key, required this.curr, required this.polis1Id, this.listDnCn});

  @override
  Widget build(BuildContext context) {
    var elements = listDnCn!.map((e) => e.toJson()).toList();

    return Container(
      color: Colors.grey[200],
      child: GroupedListView<dynamic, String>(
        elements: elements,
        groupBy: (elements) => elements['groupId'],
        groupComparator: (value1, value2) => value2.compareTo(value1),
        itemComparator: (item1, item2) =>
            item1['dncnId'].compareTo(item2['dncnId']),
        order: GroupedListOrder.ASC,
        useStickyGroupSeparators: true,        
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        groupSeparatorBuilder: (String value) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(     
            decoration: const BoxDecoration(
              //color: Colors.blueGrey,
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        indexedItemBuilder: (c, element, index) {
          return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 2.0,
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("DN/CN #($index)",
                          style: MyText.bodyMedium(context)!
                              .copyWith(color: MyColors.grey_40)),
                      Container(height: 5),
                      Text(element['dncnId'],
                          style: MyText.bodyMedium(context)!.copyWith(
                              color: MyColors.grey_80,
                              fontWeight: FontWeight.bold)),
                      Container(height: 5),
                      Text("Due Date",
                          style: MyText.bodyMedium(context)!
                              .copyWith(color: MyColors.grey_40)),
                      Container(height: 5),
                      Text(
                          DateFormat("dd-MM-yyyy")
                              .format(DateTime.parse(element['dueDate'])),
                          style: MyText.bodyMedium(context)!.copyWith(
                              color: MyColors.grey_80,
                              fontWeight: FontWeight.bold)),
                      Container(height: 5),
                      Text("Amount",
                          style: MyText.bodyMedium(context)!
                              .copyWith(color: MyColors.grey_40)),
                      Container(height: 5),
                      Text(
                          '$curr ${NumberFormat("#,###").format(double.parse(element["dncnAmount"]))}',
                          style: MyText.bodyMedium(context)!.copyWith(
                              color: MyColors.grey_80,
                              fontWeight: FontWeight.bold)),
                    ]),
              ));
        },
      ),
    );
  }
}
