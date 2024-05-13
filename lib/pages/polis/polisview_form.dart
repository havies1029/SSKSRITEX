import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:ecargo_app/blocs/polis/polisview_bloc.dart';
import 'package:ecargo_app/pages/polis/polisview_dncn.dart';
import 'package:ecargo_app/pages/polis/polisview_endors.dart';
import 'package:ecargo_app/pages/polis/polisview_files.dart';
import 'package:ecargo_app/pages/polis/polisview_form_general.dart';
import 'package:ecargo_app/pages/polis/polisview_objects.dart';
import 'package:ecargo_app/pages/polis/polisview_securitylist.dart';
import 'package:ecargo_app/widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PolisViewFormPage extends StatefulWidget {
  final String polis1Id;

  const PolisViewFormPage({super.key, required this.polis1Id});

  @override
  PolisViewFormPageState createState() => PolisViewFormPageState();
}

class PolisViewFormPageState extends State<PolisViewFormPage> {
  late PolisViewBloc polisViewBloc;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1000),
        () => retrieveData(widget.polis1Id));
  }

  @override
  Widget build(BuildContext context) {
    polisViewBloc = BlocProvider.of<PolisViewBloc>(context);

    return BlocConsumer<PolisViewBloc, PolisViewState>(
        buildWhen: (previous, current) {
          //debugPrint("buildWhen -> isLoaded : ${current.isLoaded}");
          return (current.isLoaded);
        },
        builder: (context, state) {
          bool isLoaded = state.isLoaded;
          //debugPrint("builder -> isLoaded : $isLoaded");

          if (isLoaded) {
            return Accordion(
                headerBorderColor: Colors.blueGrey,
                headerBorderColorOpened: Colors.transparent,
                // headerBorderWidth: 1,
                headerBackgroundColorOpened: Colors.green,
                contentBackgroundColor: Colors.white,
                contentBorderColor: Colors.green,
                contentBorderWidth: 3,
                contentHorizontalPadding: 5,
                scaleWhenAnimating: true,
                openAndCloseAnimation: true,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                sectionClosingHapticFeedback: SectionHapticFeedback.light,
                children: [
                  AccordionSection(
                    isOpen: true,
                    contentHorizontalPadding: 1,
                    contentVerticalPadding: 5,
                    leftIcon: const Icon(Icons.text_fields_rounded,
                        color: Colors.white),
                    header: Text('General Information',
                        style: MyText.headerStyle()),
                    content: PolisViewFormGeneralPage(
                      cstPremi: state.item!.cstPremi,
                      insuredNama: state.item!.insuredNama,
                      periodeAkhir: state.item!.periodeAkhir,
                      periodeAwal: state.item!.periodeAwal,
                      polisNo: state.item!.polisNo,
                      tsi: state.item!.tsi,
                      cobNama: state.item!.cobNama,
                      coverNo: state.item!.coverNo,
                      curr: state.item!.curr,
                    ),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon:
                        const Icon(Icons.shopping_cart, color: Colors.white),
                    header:
                        Text('Insured Object(s)', style: MyText.headerStyle()),
                    content: PolistViewObjectsPage(
                        curr: state.item!.curr, listObj: state.item!.listObj!),
                  ),

                  AccordionSection(
                    isOpen: false,
                    leftIcon:
                        const Icon(Icons.shopping_cart, color: Colors.white),
                    header: Text('Security List', style: MyText.headerStyle()),
                    content: PolisViewSecurityListPage(
                        curr: state.item!.curr,
                        listSecurities: state.item!.listSecurity),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon:
                        const Icon(Icons.shopping_cart, color: Colors.white),
                    header: Text('Endorsements', style: MyText.headerStyle()),
                    content: PolisViewEndorsPage(
                        curr: state.item!.curr,
                        listEndors: state.item!.listEndors),
                  ),
                  AccordionSection(
                    isOpen: false,
                    leftIcon:
                        const Icon(Icons.shopping_cart, color: Colors.white),
                    header: Text('DN/CN', style: MyText.headerStyle()),
                    content: PolisViewDnCNPage(
                        curr: state.item!.curr,
                        polis1Id: state.item!.polis1Id,
                        listDnCn: state.item!.listDnCn),
                  ),                 
                  AccordionSection(
                    isOpen: false,
                    leftIcon:
                        const Icon(Icons.shopping_cart, color: Colors.white),
                    header: Text('Files', style: MyText.headerStyle()),
                    contentBackgroundColor: Colors.grey[200],
                    content: PolisViewFilesPage(listDocs: state.item!.listDoc!),
                  )
                ]);
          } else {
            return const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 80.0),
                child: Column(
                  children: [
                    Text(
                      'No Data Available!!',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    /*
                    ElevatedButton(
                        onPressed: () {
                          polisViewBloc.add(
                              GetPolisViewEvent(polis1Id: widget.polis1Id));
                        },
                        child: const Text("Retrieve Data")),
                    ElevatedButton(
                        onPressed: () {
                          debugPrint("State.isLoading : ${state.isLoading}");
                          debugPrint("State.isLoaded : ${state.isLoaded}");
                        },
                        child: const Text("Cek State.isLoaded"))
                  */
                  ],
                ),
              ),
            );
          }
        },
        listener: (context, state) {});
  }

  void retrieveData(String polis1Id) {
    polisViewBloc.add(GetPolisViewEvent(polis1Id: polis1Id));
  }
}
