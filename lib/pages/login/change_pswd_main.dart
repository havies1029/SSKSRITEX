import 'package:ecargo_app/blocs/login/change_password_bloc.dart';
import 'package:ecargo_app/pages/login/change_pswd_form.dart';
import 'package:ecargo_app/repositories/login/change_password_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePswdMainPage extends StatelessWidget {
  const ChangePswdMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    //debugPrint("Masuk ke Login Page");

    return BlocProvider(
      create: (context) => ChangePasswordBloc(repository: ChangePasswordRepository()),
      child: const Scaffold(
        body: Center(child: ChangePswdForm()),
      ),
    );
  }
}
