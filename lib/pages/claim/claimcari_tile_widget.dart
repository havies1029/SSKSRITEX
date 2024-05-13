import 'package:ecargo_app/widgets/my_colors.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClaimCariTileWidget extends StatelessWidget {
	final DateTime dol;
	final String klaimLokasi;
	final String klaim1Id;
	final double lossAcc;
	final double lossEst;
	final String tolName;
	final String curr;
	final String statusKlaim;


	const ClaimCariTileWidget(
		{super.key,
		required this.dol, 
		required this.klaimLokasi, 
		required this.klaim1Id, 
		required this.lossAcc, 
		required this.lossEst, 
		required this.tolName, 
		required this.curr, 
		required this.statusKlaim});

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
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					children: [
            Text("Claim No.",
              style: MyText.bodyLarge(context)!
                  .copyWith(color: MyColors.grey_40)),
            Container(height: 5),
            Text(klaim1Id,
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_80)),
            Container(height: 10),

            Text("Date of Loss",
              style: MyText.bodyLarge(context)!
                  .copyWith(color: MyColors.grey_40)),
            Container(height: 5),            
						Text(
							DateFormat("dd-MM-yyyy").format(dol),
							style: const TextStyle(fontSize: 14.0),
						),
            Container(height: 10),     

            Text("Type of Loss",
              style: MyText.bodyLarge(context)!
                  .copyWith(color: MyColors.grey_40)),
            Container(height: 5),
            Text(tolName,
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_80)),
            Container(height: 10),     

            Text("Claim Location",
              style: MyText.bodyLarge(context)!
                  .copyWith(color: MyColors.grey_40)),
            Container(height: 5),  
            Text(klaimLokasi,
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_80)),
            Container(height: 10),

            Text("Estimation Loss",
              style: MyText.bodyLarge(context)!
                  .copyWith(color: MyColors.grey_40)),
            Container(height: 5),  
            Text("$curr ${NumberFormat("#,###").format(lossEst)}",
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_80)),
            Container(height: 10),

            Text("Claim Approved",
              style: MyText.bodyLarge(context)!
                  .copyWith(color: MyColors.grey_40)),
            Container(height: 5),  
            Text("$curr ${NumberFormat("#,###").format(lossAcc)}",
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_80)),
            Container(height: 10),

            Text("Claim Status",
              style: MyText.bodyLarge(context)!
                  .copyWith(color: MyColors.grey_40)),
            Container(height: 5),  
            Text(statusKlaim,
                style: MyText.bodyLarge(context)!
                    .copyWith(color: MyColors.grey_80)),
            Container(height: 5),
				]),
			)
		);
	}
}
