import 'package:flutter/material.dart';
import 'package:news/model/news_response.dart';
import 'package:news/news/news_item.dart';

import '../api_manager.dart';

class SearchNews extends StatelessWidget {
  String searchValue;
  SearchNews({required this.searchValue});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.SearchNews(searchValue),
        builder:(context, snapshot) {
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
          List<News> newsList=snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news:newsList[index]);
            },
            itemCount: newsList.length,
          );
        }

    );
  }
}
