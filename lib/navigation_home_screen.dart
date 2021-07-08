import 'package:soccer/app_theme.dart';
import 'package:soccer/custom_drawer/drawer_user_controller.dart';
import 'package:soccer/custom_drawer/home_drawer.dart';

import 'package:flutter/material.dart';
import 'package:soccer/main.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView =  SoccerApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
              //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            },
            screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() {
          screenView =  SoccerApp();
        });
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() {
          screenView = SoccerApp();
        });
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() {
          screenView = SoccerApp();
        });
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() {
          screenView = SoccerApp();
        });
      }
      else if (drawerIndex == DrawerIndex.Share) {
        setState(() {
          screenView = SoccerApp();
        });
      }
      else {
        //do in your way......
      }
    }
  }
}
