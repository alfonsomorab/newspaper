import 'package:flutter/material.dart';
import 'package:newspaper/src/models/news_models.dart';

class ListNewsWidget extends StatelessWidget {

  List<Article> articles;

  ListNewsWidget( this.articles );

  @override
  Widget build(BuildContext context) {



    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, index){
        return Text(articles[index].title);
      },
    );
  }
}
