import 'package:flutter/material.dart';
import 'package:newspaper/src/models/news_models.dart';
import 'package:newspaper/src/theme/theme.dart';

class ListNewsWidget extends StatelessWidget {

  final List<Article> articles;

  const ListNewsWidget( this.articles );

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, index){
        return _createCard(articles[index], index);
      },
    );
  }

  Widget _createCard( Article article, int index ){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: <Widget>[
          _createTopCard( article, index ),
          _createTitle( article ),
          _createImage( article ),
          _createDescription( article ),
          SizedBox( height: 10.0 ),
          Divider()
        ],
      ),
    );
  }

  Widget _createTopCard( Article article, int index  ){
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Text('${ index + 1 }', style: TextStyle( color: myTheme.accentColor )),
          SizedBox( width: 20.0 ),
          Text( article.source.name),
        ],
      ),
    );
  }

  Widget _createTitle(Article article) {

    return Container(
      child: Text(article.title,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    );
  }

  Widget _createImage( Article article ){
    if ( /*article.urlToImage.isNotEmpty &&*/  article.urlToImage != null){
      return Container(
        height: 300.0,
        margin: EdgeInsets.only(top: 10.0),
        child: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
            article.urlToImage
          ),
          fit: BoxFit.cover,
        )
      );
    }
    else{
      return Container();
    }
  }

  Widget _createDescription ( Article article ){
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Text( (article.description != null) ? article.description : '',
        style: TextStyle( fontSize: 17.0),
      ),
    );
  }
}


