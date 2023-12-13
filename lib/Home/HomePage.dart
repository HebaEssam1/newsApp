
import 'package:flutter/material.dart';
import 'package:news/HomeDrawer.dart';
import 'package:news/Settings_tab.dart';
import 'package:news/SourcesTab.dart';
import 'package:news/api_manager.dart';
import 'package:news/categories/Categories_tab.dart';
import 'package:news/categories/Category_details.dart';
import 'package:news/model/source_Response.dart';
import 'package:news/my_theme.dart';
import '../model/Category.dart';
class HomePage extends StatefulWidget {
  static const routeName='home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News',
        style: Theme.of(context).textTheme.headline1,),
      ),
      drawer: Drawer(
        child: HomeDrawer(onCallBack: onDrawerCallBack,),
      ),
      body:SelectedDrawer==HomeDrawer.Settings?
          SettingsTab():
      selectedCategory== null ?
          CategoriesTab(onCategoryCallBack: CategoryCallBack,):
          CategoryDetails(SelectedCategory: selectedCategory!)
    );
  }
  Category? selectedCategory=null;
  CategoryCallBack(Category category) {
    selectedCategory=category;
    setState(() {

    });
  }
  int SelectedDrawer=HomeDrawer.Categories;
  void onDrawerCallBack(int selecteditem) {
     SelectedDrawer=selecteditem;
     selectedCategory=null;
     Navigator.pop(context);
     setState(() {

     });
  }
}
