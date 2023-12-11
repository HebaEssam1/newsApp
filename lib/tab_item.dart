import 'package:flutter/material.dart';
import 'package:news/my_theme.dart';

import 'model/source_Response.dart';

class TabItem extends StatelessWidget {
 Source source;
 bool isSelected;
 TabItem({required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 20),
      margin: EdgeInsets.only(top: 18),
      decoration: BoxDecoration(
        color: isSelected==true ?
        MyTheme.primaryLightColor:
            Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyTheme.primaryLightColor)
      ),
      child: Text(source.name ?? '',
      style: TextStyle(
        fontSize: 20,
        color: isSelected==true?
            MyTheme.whiteColor:
            MyTheme.primaryLightColor

      ),),
    );
  }
}
