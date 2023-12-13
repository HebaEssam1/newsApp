import 'package:flutter/material.dart';
import 'package:news/api_manager.dart';

import '../model/Category.dart';
import '../model/news_response.dart';
import '../model/source_Response.dart';
import 'news_item.dart';

class newsScreen extends StatelessWidget {

  Source SelectedSource;
  newsScreen({required this.SelectedSource});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getNews(SelectedSource?.id ?? ''),
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
