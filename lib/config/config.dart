import 'package:flutter/material.dart';
import 'dart:convert';

class Config {
  
  // Créez un mappage des noms d'icônes aux objets IconData pour votre application 
  // car il n'est pas possible de créer un Icon ou un IconData avec un String directement
  static final Map<String, IconData> iconMap = {
    'home': Icons.home,
    'description_outlined': Icons.description_outlined,
    'account_circle_outlined': Icons.account_circle_outlined,
    // Ajoutez d'autres icônes au besoin
  };

   // Créez un json string des tab que vous désirez pour votre application
   // Mettre le Flutter ID tel que défini sur https://fonts.google.com/icons comme valeur pour la clé icon
  static const String myTabsJsonStr = '''
  [
    {"icon": "home", "text": "Tab 1", "contentText": "Tab 1 contenu"}, 
    {"icon": "description_outlined", "text": "Tab 2", "contentText": "Tab 2 contenu"},
    {"icon": "account_circle_outlined", "text": "Tab 3", "contentText": "Tab 3 contenu"}    
  ]
  ''';
    
  static final List<MyTab> myTabsObjList = MyTab.parseTabs(myTabsJsonStr,iconMap);

}

class MyTab {
  final Icon icon;
  final String text;
  final String contentText;

  MyTab({required this.icon, required this.text, required this.contentText});

  static List<MyTab> parseTabs(String jsonStr, Map<String, IconData> iconMap) {
  final parsed = json.decode(jsonStr).cast<Map<String, dynamic>>();
  return parsed
      .map<MyTab>((json) => MyTab(
            icon: MyIcon.createIconFromClassName(json['icon'],iconMap),
            text: json['text'],
            contentText: json['contentText'],
          ))
      .toList();
  }

}

class MyIcon {

  static Icon createIconFromClassName(String iconName, Map<String, IconData> iconMap ) {
    // Obtenez l'icône correspondante à partir du mappage
    final IconData? iconData = iconMap[iconName];

    if (iconData != null) {
      return Icon(iconData);
    } else {
      // Gérez le cas où l'icône n'est pas trouvée
      return Icon(Icons.error);
    }
  }

}
