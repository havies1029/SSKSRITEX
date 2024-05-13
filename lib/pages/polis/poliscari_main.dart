import 'package:flutter/material.dart';
import 'package:ecargo_app/pages/polis/poliscari_list.dart';

class PolisCariMainPage extends StatelessWidget {
	const PolisCariMainPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const PolisCariPage());
	}
}
