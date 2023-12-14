
import 'package:flutter/material.dart';
import 'package:news/HomeDrawer.dart';
import 'package:news/Settings_tab.dart';
import 'package:news/SourcesTab.dart';
import 'package:news/api_manager.dart';
import 'package:news/categories/Categories_tab.dart';
import 'package:news/categories/Category_details.dart';
import 'package:news/model/source_Response.dart';
import 'package:news/my_theme.dart';
import 'package:news/news/searchNews.dart';
import '../model/Category.dart';
class HomePage extends StatefulWidget {
  static const routeName='home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool searchflag=false;
  String searchvalue='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchflag==false?Text('News',
        style: Theme.of(context).textTheme.headline1,):
        TextField(
          onChanged: (value) {
            setState(() {
              searchvalue=value;
            });

          },
          autofocus: true, //Display the keyboard when TextField is displayed
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textInputAction: TextInputAction.search, //Specify the action button on the keyboard
          decoration: InputDecoration( //Style of TextField
            enabledBorder: UnderlineInputBorder( //Default TextField border
                borderSide: BorderSide(color: Colors.white)
            ),
            focusedBorder: UnderlineInputBorder( //Borders when a TextField is in focus
                borderSide: BorderSide(color: Colors.white)
            ),
            hintText: 'Search', //Text that is displayed when nothing is entered.
            hintStyle: TextStyle( //Style of hintText
              color: Colors.white60,
              fontSize: 20,
            ),
          ),
        ),
        actions: searchflag==false ? [
      IconButton(
        icon: Icon(
        Icons.search,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          searchflag = true;
        });
      })
    ]
        : [
    IconButton(
    icon: Icon(Icons.clear),
    onPressed: () {
    setState(() {
    searchflag = false;
    searchvalue='';
    });
    })]



      ),
      drawer: Drawer(
        child: HomeDrawer(onCallBack: onDrawerCallBack,),
      ),
      body:searchflag==true?
          SearchNews(searchValue: searchvalue):
      SelectedDrawer==HomeDrawer.Settings?
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
