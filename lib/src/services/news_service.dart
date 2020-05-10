import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newspaper/src/models/categorie_model.dart';
import 'package:newspaper/src/models/news_models.dart';
import 'package:newspaper/src/utils/api_keys.dart';

class NewsService with ChangeNotifier {

  final _keys = ApiKeys();
  final _URL_NEWS = 'https://newsapi.org/v2';


  List<Article> headlines = [];
  List<Article> articleByCategory = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  String _selectedCategory = 'busines';

  Map<String, List<Article>> categoriesArticles = {};


  NewsService() {
    //_keys.initKeys();
    this.getTopHeadlines();
    this.categories.forEach(( item ){
      this.categoriesArticles[item.name] = new List();
      print(item.name);
    });
  }

  String get selectedCategory => this._selectedCategory;

  set selectedCategory( String value ){
    this._selectedCategory = value;
    getArticlesByCategory(value);
    notifyListeners();
  }

  List<Article> get articlesByCategorySelected => this.categoriesArticles[this.selectedCategory];

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

  getArticlesByCategory( String category ) async{
    if (_keys.newsApiKey == null){
      await _keys.initKeys();
    }
    this.articleByCategory.clear();
    notifyListeners();

//    if ( categoriesArticles[category].length > 0 )
//      return categoriesArticles[category];

    final url = '$_URL_NEWS/top-headlines?country=us&apiKey=${ _keys.newsApiKey }&category=$category';
    final response = await http.get(url);
    final newResponse = newsResponseFromJson( response.body );
    print( newResponse.articles.length );

    //categoriesArticles[category].addAll(newResponse.articles);
    this.articleByCategory.addAll(newResponse.articles);
    notifyListeners();
  }
}