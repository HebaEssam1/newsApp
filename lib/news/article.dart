import 'package:flutter/material.dart';

import '../model/news_response.dart';

class Article extends StatelessWidget {
  static const routeName='article';

  @override
  Widget build(BuildContext context) {
    var news=ModalRoute.of(context)?.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        title: Text('News',
          style: Theme.of(context).textTheme.headline1,),
      ),
      body:  Container(
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
              textAlign: TextAlign.end,),
            Text(news.content ?? '',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
    maxLines: 20,),

          ],
        ),
      ),
    );
  }
}
