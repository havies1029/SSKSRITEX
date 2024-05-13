import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/widgets/listpage_filter_bar_ui.dart';
import 'package:ecargo_app/blocs/claim/claimcari_bloc.dart';
import 'package:ecargo_app/pages/claim/claimcari_list_widget.dart';

class ClaimCariPage extends StatefulWidget {
  const ClaimCariPage({super.key});

  @override
  ClaimCariPageState createState() => ClaimCariPageState();
}

class ClaimCariPageState extends State<ClaimCariPage> {
  late ClaimCariBloc claimCariBloc;
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
    claimCariBloc = BlocProvider.of<ClaimCariBloc>(context);
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
    claimCariBloc
        .add(RefreshClaimCariEvent(searchText: _searchController.text, hal: 0));
  }


  IconButton buildSearchButton() {
    return IconButton(
        icon: const Icon(
          Icons.autorenew_rounded,
          size: 35.0,
        ),
        onPressed: () {
          claimCariBloc.add(RefreshClaimCariEvent(
              searchText: _searchController.text, hal: 0));
        });
  }

  Widget buildList() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[ClaimCariListWidget(searchText: _searchController.text)],
    ));
  }
}
