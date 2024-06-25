import 'package:ecargo_app/common/app_data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:ecargo_app/blocs/chatting/chatgroupcari_bloc.dart';
import 'package:ecargo_app/blocs/chatting/chatgroupcrud_bloc.dart';
import 'package:ecargo_app/blocs/chatting/roomcari_bloc.dart';
import 'package:ecargo_app/blocs/claim/claimcari_bloc.dart';
import 'package:ecargo_app/blocs/networkconnection/network_bloc.dart';
import 'package:ecargo_app/blocs/polis/poliscari_bloc.dart';
import 'package:ecargo_app/blocs/polis/polisview_bloc.dart';
import 'package:ecargo_app/blocs/progressindicator/progressindicator_bloc.dart';
import 'package:ecargo_app/blocs/soaclient/dncncari_bloc.dart';
import 'package:ecargo_app/repositories/chatting/chatgroupcrud_repository.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/pages/home/home_page.dart';
import 'package:ecargo_app/pages/login/login_page.dart';
import 'package:ecargo_app/repositories/user/user_repository.dart';
import 'package:ecargo_app/blocs/authentication/authentication_bloc.dart';
import 'package:ecargo_app/pages/splash/splash_page.dart';
import 'package:ecargo_app/common/loading_indicator.dart';

import 'blocs/takeimage/takeimage_cubit.dart';

void main() {
  final userRepository = UserRepository();
  AppData.kIsWeb = kIsWeb;
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
        ..add(AppStarted());
    },
    child: App(
      userRepository: userRepository,
      key: null,
    ),
  ));
}

class App extends StatelessWidget {
  final UserRepository userRepository;

  const App({required super.key, required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TakeImageCubit>(
          create: (context) => TakeImageCubit(),
        ),
        BlocProvider<PolisCariBloc>(create: (context) => PolisCariBloc()),
        BlocProvider<PolisViewBloc>(create: (context) => PolisViewBloc()),
        BlocProvider<ClaimCariBloc>(create: (context) => ClaimCariBloc()),
        BlocProvider<DncnCariBloc>(create: (context) => DncnCariBloc()),
        BlocProvider<RoomCariBloc>(create: (context) => RoomCariBloc()),
        BlocProvider<ChatGroupCariBloc>(
            create: (context) => ChatGroupCariBloc()),
        BlocProvider<ChatGroupCrudBloc>(
            create: (context) => ChatGroupCrudBloc(
                chatGroupRepository: ChatGroupCrudRepository())),
        BlocProvider<ProgressIndicatorBloc>(
            create: (context) => ProgressIndicatorBloc()),
        BlocProvider<NetworkBloc>(
            create: (context) => NetworkBloc()..add(NetworkObserve())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sritex - JPS',
        theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
        // The Mandy red, dark theme.
        darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
        // Use dark or light theme based on system setting.
        themeMode: ThemeMode.light,

        routes: const {},

        //home: const MyHomePage(title: "Testing in Web",),

/*
        home: LoginPage(
                userRepository: userRepository,
              ),
*/

        home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationUninitialized) {
              debugPrint("AuthenticationUninitialized #10");

              return const SplashPage();
            }

            if (state is AuthenticationAuthenticated) {
              debugPrint("AuthenticationAuthenticated #20");

              return HomePage(
                userRepository: userRepository,
                userid: 0,
                key: null,
              );
            }

            if (state is AuthenticationUnauthenticated) {
              debugPrint("AuthenticationUnauthenticated #30");
              return LoginPage(
                userRepository: userRepository,
              );
            }

            if (AppData.kIsWeb) {
              return LoginPage(
                userRepository: userRepository,
              );
            } else {
              return const LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}

