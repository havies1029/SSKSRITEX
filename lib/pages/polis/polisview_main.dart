import 'package:ecargo_app/pages/polis/polisview_form.dart';
import 'package:ecargo_app/widgets/mobiledesign_widget.dart';
import 'package:flutter/material.dart';

class PolisViewMainPage extends StatelessWidget {
  final String polis1Id;

  const PolisViewMainPage({super.key, required this.polis1Id});

  @override
  Widget build(BuildContext context) {
    return MobileDesignWidget(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Detail Polis'),
          ),
          backgroundColor: Colors.grey[100],
          body: PolisViewFormPage(polis1Id: polis1Id)      
      ),
    );
  }
}
