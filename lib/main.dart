import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/Home/HomePage.dart';
import 'package:news/Settings_tab.dart';
import 'package:news/categories/Categories_tab.dart';
import 'package:news/my_theme.dart';
import 'package:news/news/article.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.LightTheme,
      
      routes:
      {HomePage.routeName :(context)=> HomePage(),
        Article.routeName: (context) => Article(),
      SettingsTab.routeName:(context) => SettingsTab()},
      initialRoute: HomePage.routeName,
    );
  }

}