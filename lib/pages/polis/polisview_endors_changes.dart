import 'package:ecargo_app/models/polis/endors99crud_model.dart';
import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:ecargo_app/widgets/transformablelist.dart';
import 'package:flutter/material.dart';
import 'package:transformable_list_view/transformable_list_view.dart';

class PolisViewEndorsChangesWidget extends StatelessWidget {
  final List<Endors99CrudModel> listChanges;

  const PolisViewEndorsChangesWidget({super.key, required this.listChanges});

  @override
  Widget build(BuildContext context) {              
    return buildListChanges(listChanges); 
  }

  TransformableListView buildListChanges(List<Endors99CrudModel> listItem) {      
    ScrollController scrollController = ScrollController();

    return TransformableListView.builder(
        controller: scrollController,
        padding: EdgeInsets.zero,
        getTransformMatrix: TransformMatrices.rotate,
        itemCount: listItem.length,
        itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
              padding: const EdgeInsets.all(0.2),
              decoration: BoxDecoration(
                  //color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: <Widget>[
                  buildCardItemChanged(context, listItem[index])
                ],
              ),
            ));
  }

  Card buildCardItemChanged(BuildContext context, Endors99CrudModel item) {
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
            Text("Item Changed",
                style: MyText.bodyMedium(context)!
                    .copyWith(color: MyColors.grey_40)),
            Container(height: 5),
            Text(item.endorsDesc,
                style: MyText.bodyMedium(context)!.copyWith(
                    color: MyColors.grey_80, fontWeight: FontWeight.bold)),            
            const Divider(
              color: MyColors.grey_100_,
              height: 15,
            ),            
            Text("Old Value",
                style: MyText.bodyMedium(context)!
                    .copyWith(color: MyColors.grey_40)),
            Container(height: 5),
            Text(item.valueOld,
                style: MyText.bodyMedium(context)!.copyWith(
                    color: MyColors.grey_80, fontWeight: FontWeight.bold)),
            Container(height: 10),
            Text("New Value",
                style: MyText.bodyMedium(context)!
                    .copyWith(color: MyColors.grey_40)),
            Container(height: 5),
            Text(item.valueNew,
                style: MyText.bodyMedium(context)!.copyWith(
                    color: MyColors.grey_80, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
