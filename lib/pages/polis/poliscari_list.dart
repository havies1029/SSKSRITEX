import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/widgets/listpage_filter_bar_ui.dart';
import 'package:ecargo_app/blocs/polis/poliscari_bloc.dart';
import 'package:ecargo_app/pages/polis/poliscari_list_widget.dart';

class PolisCariPage extends StatefulWidget {
	const PolisCariPage({super.key});

	@override
	PolisCariPageState createState() => PolisCariPageState();
}

class PolisCariPageState extends State<PolisCariPage> {
	late PolisCariBloc polisCariBloc;
	final TextEditingController _searchController = TextEditingController();
	final ScrollController _scrollController = ScrollController();

	@override
	void initState() {
		super.initState();
		Future.delayed(const Duration(milliseconds: 500), () {
			refreshData();
		});
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
		polisCariBloc = BlocProvider.of<PolisCariBloc>(context);
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
		polisCariBloc.add(
			RefreshPolisCariEvent(searchText: _searchController.text, hal: 0));
	}

	void _onScroll() {
		if (!_scrollController.hasClients) return;
		if (_scrollController.position.pixels ==
				_scrollController.position.maxScrollExtent) {
			polisCariBloc.add(FetchPolisCariEvent(
				searchText: _searchController.text, hal: polisCariBloc.state.hal));
		}
	}

	IconButton buildSearchButton() {
		return IconButton(
			icon: const Icon(
				Icons.autorenew_rounded,
				size: 35.0,
			),
			onPressed: () {
			polisCariBloc.add(RefreshPolisCariEvent(
				searchText: _searchController.text, hal: 0));
			});
	}

	Widget buildList() {
		return const Expanded(
			child: Column(
				mainAxisAlignment: MainAxisAlignment.start,
				children: <Widget>[PolisCariListWidget()],
		));
	}

}
