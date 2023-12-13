import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/news_response.dart';

import 'model/source_Response.dart';
class ApiManager {
  static const String baseurl='newsapi.org';
  static Future<SourceResponse> getSources(String categoryId) async{
    var url =Uri.https(baseurl,'/v2/top-headlines/sources',
    {
      'apiKey':'7eebed9b18854c7ca8d4689ed7907731',
      'category':categoryId
    });
    try{
      var response=await http.get(url);
      var bodyString=response.body;
      var json=jsonDecode(bodyString);
      var sourceresponse=SourceResponse.fromJson(json);
      return sourceresponse;
    }catch (e){
      throw e;
    }
}
  static Future<NewsResponse> getNews (String sourceId) async{
    var url= Uri.https(baseurl,'/v2/everything',
    {
      'apiKey':'7eebed9b18854c7ca8d4689ed7907731',
      'sources':sourceId
    });
    try{
      var response=await http.get(url);
      var bodyString=response.body;
      var json=jsonDecode(bodyString);
      var newsresponse=NewsResponse.fromJson(json);
      return newsresponse;
    }catch(e){
      throw e;
    }

  }
}