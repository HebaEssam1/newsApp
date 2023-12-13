import 'package:flutter/material.dart';
import 'package:news/model/source_Response.dart';
import 'package:news/news/news_screen.dart';

import '../SourcesTab.dart';
import '../api_manager.dart';
import '../model/Category.dart';

class CategoryDetails extends StatelessWidget {
  Category SelectedCategory;
  CategoryDetails({required this.SelectedCategory});


  @override
  Widget build(BuildContext context) {
    return
        FutureBuilder<SourceResponse>(
          future: ApiManager.getSources(SelectedCategory.id ),
          builder: (context, snapshot)
          {
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            else if(snapshot.hasError){
              return Column(
                children: [
                  Text('Something went wrong'),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('Try Again'))
                ],
              );
            }
            if(snapshot.data?.status!='ok'){
              return Column(
                children: [
                  Text(snapshot.data?.message ?? ''),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('Try Again'))
                ],
              );
            }

            var sourceList=snapshot.data?.sources ?? [];
            return SourcesTab(sources: sourceList,);

          },

        )


        ;
  }
}
