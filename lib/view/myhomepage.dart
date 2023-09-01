import 'package:flutter/material.dart';
import '../config/config.dart';
import '../widget/myappbar.dart';
import '../widget/mydrawer.dart';
import '../widget/mytabbar.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: Config.myTabsObjList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(tabController: _tabController),
      body: TabBarView(
        controller: _tabController,
        children:Config.myTabsObjList.map((tab) {
          return Center(
            child: Text(tab.contentText), // Utilisez le contentText de l'objet MyTab
          );
        }).toList(),
      ),
      bottomNavigationBar: MyTabBar(tabController: _tabController, tabs: Config.myTabsObjList),
      drawer: MyDrawer(tabController: _tabController),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'config.dart'; // Importez le fichier config.dart pour les onglets
// import 'my_tab_bar.dart'; // Importez la nouvelle classe MyTabBar

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   final TabController _tabController = TabController(length: tabs.length, vsync: MyVSync());

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('TabBar Example'),
//           bottom: MyTabBar(tabController: _tabController, tabs: tabs),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: [
//             // Contenu de l'onglet 1
//             Center(child: Text('Contenu de l\'onglet 1')),
//             // Contenu de l'onglet 2
//             Center(child: Text('Contenu de l\'onglet 2')),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyVSync implements TickerProvider {
//   @override
//   Ticker createTicker(onTick) {
//     return Ticker(onTick);
//   }
// }

