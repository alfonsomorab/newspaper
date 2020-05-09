import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newspaper/src/models/news_models.dart';
import 'package:newspaper/src/utils/api_keys.dart';

class NewsService with ChangeNotifier {

  List<Article> headlines = [];
  final _keys = ApiKeys();
  final _URL_NEWS = 'https://newsapi.org/v2';

  NewsService() {
    //_keys.initKeys();
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    if (_keys.newsApiKey == null){
      await _keys.initKeys();
    }

    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=${ _keys.newsApiKey }';
    print(url);
    final response = await http.get(url);
    final newResponse = newsResponseFromJson( response.body );
    headlines.addAll( newResponse.articles );
    print('${headlines.length}');
    notifyListeners();
  }
}