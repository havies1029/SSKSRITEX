import 'package:ecargo_app/pages/chatting/roomcari_list.dart';
import 'package:ecargo_app/pages/claim/claimcari_main.dart';
import 'package:ecargo_app/pages/groupchat/groupchat_page.dart';
import 'package:ecargo_app/pages/home/home_page.dart';
import 'package:ecargo_app/menu/app_menu_drawer.dart';
import 'package:ecargo_app/pages/base/base_page.dart';
import 'package:ecargo_app/common/styles.dart';
import 'package:ecargo_app/pages/polis/poliscari_main.dart';
import 'package:ecargo_app/pages/polis/polisview_main.dart';
import 'package:ecargo_app/pages/soaclient/dncncari_list.dart';
import 'package:flutter/material.dart';
import 'package:ecargo_app/pages/profile/profile_main_page.dart';
import 'package:ecargo_app/repositories/user/user_repository.dart';

class PageContainerWithUserRepository extends PageContainerBase {
  final int userid;
  final UserRepository userRepository;
  final PageType pageType;

  const PageContainerWithUserRepository(
      {required super.key,
      required this.userid,
      required this.userRepository,
      required this.pageType});

  @override
  Widget get menuDrawer => const AppMenu();

  @override
  String get pageTitle {
    //debugPrint("PageContainerWithUserRepository -> pageTitle");
    switch (pageType) {
      case PageType.profile:
        return "Profile";      
      case PageType.listpolis:
        return "Daftar Polis";
      default:
        return "Login Page";
    }
  }

  @override
  Widget get body {
    Widget? page;
    //debugPrint("PageContainerWithUserRepository -> body");
    switch (pageType) {
      case PageType.home:
        page = HomePage(
          userid: userid,
          userRepository: userRepository,
          key: null,
        );
        break;      
      case PageType.listpolis:
        page = PolisCariMainPage(key: key);
        break;
      case PageType.profile:
        page = ProfileMainPage(
          userid: userid,
          userRepository: userRepository,
        );
        break;      
      default:
        page = null;
    }
    return Padding(
      padding: EdgeInsets.all(Spacing.matGridUnit()),
      child: page,
    );
  }

  @override
  Widget get background => Container();

  @override
  Color get backgroundColor => AppColors.background;

  @override
  PageType? get parentModal => null;
}

class PageContainer extends PageContainerBase {
  final PageType pageType;
  final String? recId;

  const PageContainer({super.key, required this.pageType, this.recId});

  @override
  Widget get menuDrawer => const AppMenu();

  @override
  String get pageTitle {
    switch (pageType) {
      case PageType.profile:
        return "Profile";      
      case PageType.listpolis:
        return "List Policy";
      case PageType.viewpolis:
        return "View Policy";
      case PageType.listclaim:
        return "List Claim";
      case PageType.roomchat:
        return "Chat Support";
      case PageType.soaclient:
        return "SOA Client";
      default:
        return "Login Page";
    }
  }

  @override
  Widget get body {
    Widget? page;

    switch (pageType) {
      case PageType.listpolis:
        page = PolisCariMainPage(key: key);
        break;
      case PageType.groupchat:
        page = const ChatPage(roomId: "support");
        break;
      case PageType.viewpolis:
        page = PolisViewMainPage(key: key, polis1Id: recId!);
        break;
      case PageType.listclaim:
        page = ClaimCariMainPage(key: key);
        break;
      case PageType.roomchat:
        page = const RoomCariPage();
        break;
      case PageType.soaclient:
        page = const DncnCariPage();
        break;
      default:
        page = null;
    }
    return Padding(
      padding: EdgeInsets.all(Spacing.matGridUnit()),
      child: page,
    );
  }

  @override
  Widget get background => Container();

  @override
  Color get backgroundColor => AppColors.background;

  @override
  PageType? get parentModal => null;
}
