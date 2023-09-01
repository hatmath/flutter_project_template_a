import 'package:flutter/material.dart';
import '../theme/mytheme.dart';

class MyDrawer extends StatelessWidget {
  final TabController tabController;

  const MyDrawer({required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: MyGlobalTheme.darkTheme.drawerTheme.shadowColor, // Utilisation du darkDrawerTheme
              // color: MyTheme.darkTheme.secondaryHeaderColor
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: MyGlobalTheme.darkTheme.primaryColorLight, // Utilisation du darkDrawerTheme
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Tab 1'),
            onTap: () {
              Navigator.pop(context);
              tabController.animateTo(0);
            },
          ),
          ListTile(
            title: Text('Tab 2'),
            onTap: () {
              Navigator.pop(context);
              tabController.animateTo(1);
            },
          ),
        ],
      ),
    );
  }
}

