import 'package:flutter/material.dart';

import '../model/Category.dart';

class CategoryWidget extends StatelessWidget {
  Category category;
  int index;
  CategoryWidget({required this.category ,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(category.color),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomLeft: Radius.circular((index%2==0)? 18:0),
          bottomRight: Radius.circular((index%2==0)?0:18)
        )
      ),
      child: Column(
        children: [
          Image.asset(category.imagePath),
          Text(category.title,style: Theme.of(context).textTheme.headline3,)
        ],
      ),



    );
  }
}
