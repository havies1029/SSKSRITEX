import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/blocs/polis/poliscari_bloc.dart';
import 'package:ecargo_app/pages/polis/poliscari_tile_widget.dart';
import 'package:ecargo_app/models/polis/poliscari_model.dart';

class PolisCariListWidget extends StatefulWidget {
  
	const PolisCariListWidget({super.key});

	@override
	PolisCariListWidgetState createState() => PolisCariListWidgetState();
}

class PolisCariListWidgetState extends State<PolisCariListWidget> {  
  ScrollController scrollController = ScrollController();
	List<PolisCariModel> polisCari = [];
  
	@override
	Widget build(BuildContext context) {    
    debugPrint("PolisCariListWidgetState -> build");

		return BlocConsumer<PolisCariBloc, PolisCariState>(
			builder: (context, state) {

    debugPrint("ListStatus #110 : ${state.status}");

		if (state.status == ListStatus.success) {
			if (!state.hasReachedMax) {
				polisCari.addAll(state.items);
			}

		return state.items.isNotEmpty
			? Flexible(
				child: ListView.builder(
            padding: EdgeInsets.zero,
            //getTransformMatrix: TransformMatrices.rotate,
            itemCount: state.items.length,
            controller: scrollController,
            itemBuilder: (context, index) =>

              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                padding: const EdgeInsets.all(0.2),
                decoration: BoxDecoration(
                  //color: Colors.cyanAccent,
                  borderRadius: BorderRadius.circular(15.0)),
                child: Column(
                  children: <Widget>[
                    PolisCariTileWidget(
                      cstPremi: state.items[index].cstPremi,
                      insuredNama: state.items[index].insuredNama,
                      periodeAkhir: state.items[index].periodeAkhir,
                      periodeAwal: state.items[index].periodeAwal,
                      placing1Id: state.items[index].placing1Id,
                      polisIssued: state.items[index].polisIssued,
                      polisNo: state.items[index].polisNo,
                      polis1Id: state.items[index].polis1Id,
                      tsi: state.items[index].tsi,
                      cobNama: state.items[index].cobNama,
                      coverNo: state.items[index].coverNo,
                      curr: state.items[index].curr,
                    )
                  ],
                ),
              )
            
          ),
				)
			: const Center(
				child: Padding(
					padding: EdgeInsets.only(top: 80.0),
					child: Text(
						'No Data Available!!',
						style: TextStyle(
							color: Colors.red,
							fontSize: 12.0,
							fontWeight: FontWeight.bold),
					),
				),
			);
		} else {
			return const Center(
					child: Text(
						'No Data Available!!',
						style: TextStyle(
							color: Colors.red,
							fontSize: 12.0,
							fontWeight: FontWeight.bold),
					),
				);
			}
			}, buildWhen: (previous, current) {
        debugPrint("buildWhen #210 : ${current.status}");
				return (current.status == ListStatus.success);
			}, listener: (context, state) {}
		);
	}
}



