import 'package:flutter/material.dart';
import '../theme/mytheme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final TabController tabController;

  const MyAppBar({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //  MyAppBarTheme.defaultAppBarTheme,
      title: Text('Home'),
      actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            tabController.animateTo(0);
          },
        ),
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () {
            tabController.animateTo(1);
          },
        ),
      ],
    );
  }
}
