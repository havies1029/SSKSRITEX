import 'package:ecargo_app/pages/home/home.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecargo_app/blocs/authentication/authentication_bloc.dart';
import 'package:ecargo_app/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({super.key});

  @override
  AppMenuState createState() => AppMenuState();
}

class AppMenuState extends State<AppMenu> with RouteAware {
  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            currentAccountPictureSize: const Size.square(120),
            currentAccountPicture: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                //color: Colors.blue,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Image.asset('assets/icons/logo_jps.png', width: 100, height: 100,),
              ),
            ),
            accountEmail: const Text("support@jayaproteksindo.co.id"),
            accountName: const Text("CS-Support"),
            onDetailsPressed: () {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).pop();
                homeBloc.add(ProfilePageActiveEvent());
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            //selected: _activeRoute == AppRoutes.homePage,
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).pop();
                homeBloc.add(ProfilePageActiveEvent());
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.note_alt),
            title: const Text("List Policy"),
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).pop();
                homeBloc.add(PolisCariPageActiveEvent());
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.notes),
            title: const Text("List Claim"),
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).pop();
                homeBloc.add(ListClaimPageActiveEvent());
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.attach_money),
            title: const Text("SOA Client"),
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).pop();
                homeBloc.add(DnCnCariPageActiveEvent());
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text("Chat Support"),
            //selected: _activeRoute == AppRoutes.homePage,
            onTap: () {              
              SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                Navigator.of(context).pop();
                homeBloc.add(RoomCariPageActiveEvent());
              });
            },
          ),                       
          const AboutListTile(
            icon: Icon(Icons.info),
            applicationName: "JPS SuperApp",
            aboutBoxChildren: <Widget>[
              Text("http://www.jayaproteksindo.co.id/", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
              Text("version : 0.2", style: TextStyle(fontSize: 12.0),),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          ),
        ],
      ),
    );
  }
}
