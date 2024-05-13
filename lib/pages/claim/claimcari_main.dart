import 'package:flutter/material.dart';
import 'package:ecargo_app/pages/claim/claimcari_list.dart';

class ClaimCariMainPage extends StatelessWidget {
	const ClaimCariMainPage({super.key});

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: Colors.grey[100],
			body: const ClaimCariPage(),
		);
	}
}
