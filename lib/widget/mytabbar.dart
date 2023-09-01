import 'package:flutter/material.dart';
import '../config/config.dart'; // Importez le fichier config.dart pour les onglets

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  final List<MyTab> tabs;

  MyTabBar({required this.tabController, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorColor: Colors.blue,
      labelColor: Colors.blue,
      tabs: tabs.map((tab) {
        return Tab(icon: tab.icon, text: tab.text);
      }).toList(),
    );
  }
}

// -------------------------
// Version avant config.dart
// -------------------------
// import 'package:flutter/material.dart';

// class MyTabBar extends StatelessWidget {
//   final TabController tabController;

//   MyTabBar({required this.tabController});

//   @override
//   Widget build(BuildContext context) {
//     return TabBar(
//       controller: tabController,
//       indicatorColor: Colors.blue,
//       labelColor: Colors.blue,
//       tabs: [
//         Tab(icon: Icon(Icons.home), text: 'Tab 1'),
//         Tab(icon: Icon(Icons.settings), text: 'Tab 2'),
//       ],
//     );
//   }
  
// }



