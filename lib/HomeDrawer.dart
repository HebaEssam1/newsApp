import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/Settings_tab.dart';
import 'package:news/categories/Categories_tab.dart';
import 'package:news/my_theme.dart';

class HomeDrawer extends StatelessWidget {
  Function onCallBack;
  HomeDrawer({required this.onCallBack});
  static const int Categories=1;
  static const int Settings=2;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
               Container(
                 padding: EdgeInsets.symmetric(
                   vertical: 40,
                 ),
                 height: 100,
                 color: MyTheme.primaryLightColor,
                 child: Text('News App!',
                   style: Theme.of(context).textTheme.headline1,
                 textAlign:TextAlign.center,),
               ),
              InkWell(
                onTap: (){
                  onCallBack(1);
                },
                child: Row(
                  children: [
                    Icon(Icons.list,
                     size: 50,),
                    SizedBox(width: 15,),
                    Text('Categories',
                    style: Theme.of(context).textTheme.headline2,)
                  ],
                ),
              ),
          InkWell(
            onTap: (){
              onCallBack(2);
            },
            child: Row(
              children: [
                Icon(Icons.settings,
                  size: 50,),
                SizedBox(width: 15,),
                Text('Settings',
                  style: Theme.of(context).textTheme.headline2,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
