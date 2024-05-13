import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/blocs/claim/claimcari_bloc.dart';
import 'package:ecargo_app/pages/claim/claimcari_tile_widget.dart';
import 'package:ecargo_app/models/claim/claimcari_model.dart';

class ClaimCariListWidget extends StatefulWidget {
  final String searchText;
  const ClaimCariListWidget({super.key, required this.searchText});

  @override
  ClaimCariListWidgetState createState() => ClaimCariListWidgetState();
}

class ClaimCariListWidgetState extends State<ClaimCariListWidget> {
  late ClaimCariBloc claimCariBloc;
  final ScrollController _scrollController = ScrollController();
  List<ClaimCariModel> claimCari = [];

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
    claimCariBloc = BlocProvider.of<ClaimCariBloc>(context);
    return BlocConsumer<ClaimCariBloc, ClaimCariState>(
        builder: (context, state) {
          debugPrint("ListStatus #110 : ${state.status}");

          if (state.status == ListStatus.success) {
            if (!state.hasReachedMax) {
              claimCari.addAll(state.items);
            }

            return state.items.isNotEmpty
                ? Flexible(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        controller: _scrollController,
                        //getTransformMatrix: TransformMatrices.rotate,
                        itemCount: state.items.length,
                        itemBuilder: (context, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              padding: const EdgeInsets.all(0.2),
                              decoration: BoxDecoration(
                                  //color: Colors.cyanAccent,
                                  borderRadius: BorderRadius.circular(15.0)),
                              child: Column(
                                children: <Widget>[
                                  ClaimCariTileWidget(
                                    dol: state.items[index].dol,
                                    klaimLokasi: state.items[index].klaimLokasi,
                                    klaim1Id: state.items[index].klaim1Id,
                                    lossAcc: state.items[index].lossAcc,
                                    lossEst: state.items[index].lossEst,
                                    tolName: state.items[index].tolName,
                                    curr: state.items[index].curr,
                                    statusKlaim: state.items[index].statusKlaim,
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
        },
        buildWhen: (previous, current) {
          return (current.status == ListStatus.success);
        },
        listener: (context, state) {});
  }

  void _onScroll() {
    debugPrint("_onScroll");
    if (!_scrollController.hasClients) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      claimCariBloc.add(FetchClaimCariEvent(
          searchText: widget.searchText, hal: claimCariBloc.state.hal));
    }
  }
}
