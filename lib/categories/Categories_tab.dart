import 'package:flutter/material.dart';
import 'package:news/categories/Category_widget.dart';

import '../model/Category.dart';

class CategoriesTab extends StatelessWidget {
   var categoriesList=Category.getCategoryList();
   Function onCategoryCallBack;
   CategoriesTab({required this.onCategoryCallBack});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your Category\n of interest',
            style: Theme.of(context).textTheme.headline2,),
          SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18
              ),
              itemBuilder: (context,index){
                return InkWell(
                  onTap: () => onCategoryCallBack(categoriesList[index]),
                    child: CategoryWidget(category: categoriesList[index], index: index));
              },
              itemCount: 6,
            ),
          ),
        ],
      )

    );
  }
}
