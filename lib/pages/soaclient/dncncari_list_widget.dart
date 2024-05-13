import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/blocs/soaclient/dncncari_bloc.dart';
import 'package:ecargo_app/pages/soaclient/dncncari_tile_widget.dart';
import 'package:ecargo_app/models/soaclient/dncncari_model.dart';

class DncnCariListWidget extends StatefulWidget {
	final String searchText;
	const DncnCariListWidget({super.key, required this.searchText});

	@override
	DncnCariListWidgetState createState() => DncnCariListWidgetState();
}

class DncnCariListWidgetState extends State<DncnCariListWidget> {
	late DncnCariBloc dncnCariBloc;
	List<DncnCariModel> dncnCari = [];
	final ScrollController _scrollController = ScrollController();

	@override
	void initState() {
		super.initState();
		_scrollController.addListener(_onScroll);
	}

	@override
	void dispose() {
		_scrollController
			..removeListener(_onScroll)
			..dispose();
		super.dispose();
	}

	@override
	Widget build(BuildContext context) {
		dncnCariBloc = BlocProvider.of<DncnCariBloc>(context);
		return BlocConsumer<DncnCariBloc, DncnCariState>(
			builder: (context, state) {
		if (state.status == ListStatus.success) {
			if (!state.hasReachedMax) {
				dncnCari.addAll(state.items);
			}

		return state.items.isNotEmpty
			? Flexible(
				child: ListView.builder(
					padding: EdgeInsets.zero,
					controller: _scrollController,
					itemCount: state.items.length,
					itemBuilder: (_, index) => Container(
						margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
						padding: const EdgeInsets.all(0.2),
						decoration: BoxDecoration(
							borderRadius: BorderRadius.circular(15.0)),
						child: Column(
							children: <Widget>[
								DncnCariTileWidget(
									coverNo: state.items[index].coverNo,
									curr: state.items[index].curr,
									dueDate: state.items[index].dueDate,
									endors1Id: state.items[index].endors1Id,
									insuredName: state.items[index].insuredName,
									invAmount: state.items[index].invAmount,
									inv1Id: state.items[index].inv1Id,
									polisNo: state.items[index].polisNo,
                  invType: state.items[index].invType,
								)
							],
						),
					)),
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
				return (current.status == ListStatus.success);
			}, listener: (context, state) {}
		);
	}
	void _onScroll() {
		if (!_scrollController.hasClients) return;
		if (_scrollController.position.pixels ==
				_scrollController.position.maxScrollExtent) {
			dncnCariBloc.add(FetchDncnCariEvent(
				searchText: widget.searchText, hal: dncnCariBloc.state.hal));
		}
	}

}
