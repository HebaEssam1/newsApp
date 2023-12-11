import 'package:flutter/material.dart';
import 'package:news/HomeDrawer.dart';
import 'package:news/categories/Categories_tab.dart';
import 'package:news/my_theme.dart';

class HomePage extends StatelessWidget {

  static const routeName='home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News',
        style: Theme.of(context).textTheme.headline1,),
      ),
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      body: CategoriesTab(),
    );
  }
}
