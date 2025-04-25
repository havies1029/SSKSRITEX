import 'package:ecargo_app/models/polis/polis2parcrud_model.dart';
import 'package:ecargo_app/models/polis/polis2paritemcrud_model.dart';
import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PolistViewObjectsPage extends StatelessWidget {
  final String curr;
  final List<Polis2parCrudModel> listObj;

  const PolistViewObjectsPage(
      {super.key, required this.curr, required this.listObj});

  @override
  Widget build(BuildContext context) {        
    ScrollController scrollController = ScrollController();

    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: listObj.length,
          itemBuilder: ((context, index) {
            // Return a widget representing the category and its items
            return Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Padding(
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
                          "Object #${index + 1}",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    elevation: 2,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      height: 280,
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.all(5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Risk Location",
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_60)),
                            Container(height: 5),
                            Text(listObj[index].lokasiAlamat1,
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_90)),
                            Text(listObj[index].lokasiAlamat2,
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_90)),
                            Container(height: 5),
                            const Divider(
                              color: MyColors.grey_100_,
                              height: 15,
                            ),
                            Container(height: 5),
                            Text("Occupancy",
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_60)),
                            Container(height: 5),
                            Text(
                                "${listObj[index].okupasiKode} - ${listObj[index].okupasiNama}",
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_90)),
                            Container(height: 10),
                            Text("Sum Insured",
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_60)),
                            Container(height: 5),
                            Text(
                                "$curr ${NumberFormat("#,###").format(listObj[index].tsiNilai)}",
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_90)),
                            Container(height: 10),
                            Text("Premium",
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_60)),
                            Container(height: 5),
                            Text(
                                "$curr ${NumberFormat("#,###").format(listObj[index].totalPremi)}",
                                style: MyText.bodyLarge(context)!
                                    .copyWith(color: MyColors.grey_90)),
                          ]),
                    )),
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  elevation: 2,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "Item Cover :",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: listObj[index].listParItem!.length,
                  itemBuilder: (BuildContext context, int idx) {
                    Polis2paritemCrudModel item =
                        listObj[index].listParItem![idx];
                    // Return a widget representing the item
                    return Card(
                      color: Colors.white,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      elevation: 2,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(item.itemDesc,
                                    style: MyText.bodyLarge(context)!
                                        .copyWith(color: MyColors.grey_90)),
                                const Spacer(),
                                Text(
                                    "$curr ${NumberFormat("#,###").format(item.siNilai)}",
                                    style: MyText.bodyLarge(context)!
                                        .copyWith(color: MyColors.grey_90)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          })),
    );
  }
}
