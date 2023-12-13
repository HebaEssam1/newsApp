import 'package:flutter/material.dart';
import 'package:news/model/news_response.dart';
import 'package:news/news/article.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});
    
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(Article.routeName,
        arguments: news);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18)
              ),
              child: Image.network(news.urlToImage ?? ''),
            ),
            SizedBox(height: 8,),
            Text(news.author ?? '',
            style: TextStyle(
              fontSize: 15,
              color: Colors.black38
            ),),
            Text(news.title ?? '',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20
            ),),
            Text(news.publishedAt ?? '',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black38,
              ),
            textAlign: TextAlign.end,)
          ],
        ),
      ),
    );
  }
}
