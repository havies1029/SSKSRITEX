import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/widgets/listpage_filter_bar_ui.dart';
import 'package:ecargo_app/blocs/soaclient/dncncari_bloc.dart';
import 'package:ecargo_app/pages/soaclient/dncncari_list_widget.dart';

class DncnCariPage extends StatefulWidget {
	const DncnCariPage({super.key});

	@override
	DncnCariPageState createState() => DncnCariPageState();
}

class DncnCariPageState extends State<DncnCariPage> {
	late DncnCariBloc dncnCariBloc;
	final TextEditingController _searchController = TextEditingController();
	@override
	void initState() {
		super.initState();
		Future.delayed(const Duration(milliseconds: 500), () {
			refreshData();
		});
	}

	@override
	Widget build(BuildContext context) {
		dncnCariBloc = BlocProvider.of<DncnCariBloc>(context);
		return Center(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				children: [
					ListPageFilterBarUIWidget(
						searchController: _searchController,
						searchButton: buildSearchButton()),
					buildList()
				],

			),
		);
	}
	void refreshData() {
		dncnCariBloc.add(
			RefreshDncnCariEvent(searchText: _searchController.text, hal: 0));
	}

	IconButton buildSearchButton() {
		return IconButton(
			icon: const Icon(
				Icons.autorenew_rounded,
				size: 35.0,
			),
			onPressed: () {
			dncnCariBloc.add(RefreshDncnCariEvent(
				searchText: _searchController.text, hal: 0));
			});
	}

	Widget buildList() {
		return Expanded(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[DncnCariListWidget(searchText: _searchController.text)],
		));
	}

}
