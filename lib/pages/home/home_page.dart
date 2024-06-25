import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/blocs/home/home_bloc.dart';
import 'package:ecargo_app/blocs/profile/profile_bloc.dart';
import 'package:ecargo_app/common/size_config.dart';
import 'package:ecargo_app/pages/base/base_container.dart';
import 'package:ecargo_app/pages/base/base_page.dart';
import 'package:ecargo_app/repositories/user/user_repository.dart';

class HomePage extends StatefulWidget {
  final int userid;
  final UserRepository userRepository;

  const HomePage(
      {required super.key, required this.userid, required this.userRepository});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<ProfileBloc>(
          create: (content) => ProfileBloc(
              userRepository: widget.userRepository, id: widget.userid),
        ),
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          SizeConfig().init(context);
          if (state is HomePageActive) {
            debugPrint("HomePageActive");
            return const PageContainer(pageType: PageType.listpolis);
            //return const PageContainer(pageType: PageType.listmember);
          } 
          /*else if (state is ChatSupportPageActive) {
            debugPrint("ChatSupportPageActive");

            return const PageContainer(pageType: PageType.groupchat);
          } */
          else if (state is RoomCariPageActive) {
            debugPrint("RoomCariPageActive");

            return const PageContainer(pageType: PageType.roomchat);
          } 
          /*
          else if (state is ClaimSupportPageActive) {
            debugPrint("ClaimSupportPageActive");

            return const PageContainer(pageType: PageType.claimchat);
          } 
          */
          else if (state is PolisCariPageActive) {
            debugPrint("PolisCariPageActive");

            return const PageContainer(pageType: PageType.listpolis);
          } else if (state is PolisViewPageActive) {
            return PageContainer(
                pageType: PageType.viewpolis, recId: state.polis1Id);
          } else if (state is ListClaimPageActive) {
            debugPrint("ListClaimPageActive");

            return const PageContainer(pageType: PageType.listclaim);
          } else if (state is DnCnCariPageActive) {
            debugPrint("DnCnCariPageActive");

            return const PageContainer(pageType: PageType.soaclient);            
          } else if (state is ChangePasswordPageActive) {
            debugPrint("ChangePasswordPageActive");
            return const PageContainer(pageType: PageType.changepswd);              
          } else if (state is ProfilePageActive) {
            return PageContainerWithUserRepository(
              pageType: PageType.profile,
              userRepository: widget.userRepository,
              userid: widget.userid,
              key: null,
            );
          }

          return Container();
        },
      ),
    );
  }
}
