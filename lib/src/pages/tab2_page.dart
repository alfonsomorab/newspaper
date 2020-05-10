import 'package:flutter/material.dart';
import 'package:newspaper/src/models/categorie_model.dart';
import 'package:newspaper/src/services/news_service.dart';
import 'package:newspaper/src/widgets/list_news_widget.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final newsServices = Provider.of<NewsService>(context);
    final categorie = newsServices.selectedCategory;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _listCategoriesTop(context, newsServices.categories),
            Expanded(child: ListNewsWidget( newsServices.articleByCategory ))
//            ( newsServices.categoriesArticles[categorie].length > 0 )
//              ? ListNewsWidget( newsServices.categoriesArticles[newsServices.selectedCategory] )
//              : Center( child: CircularProgressIndicator() ),
          ],
        ),
      ),
    );
  }

  Widget _listCategoriesTop( BuildContext context, List<Category> categories){

    final newsService = Provider.of<NewsService>(context);

    return Container(
      height: 80.0,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int i){
          return GestureDetector(
            onTap: (){
              //print( categories[i].name );
              newsService.selectedCategory = categories[i].name;
            },
            child: _cardCategory( context, categories, i )
          );
        }
      ),
    );
  }

  Widget _cardCategory(BuildContext context, List<Category> categories, int i) {

    final newsService = Provider.of<NewsService>(context);
    return Container(

      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(5.0),
      height: 30.0,
      width: 90.0,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(categories[i].icon,
            color: (newsService.selectedCategory == categories[i].name)
              ? Colors.red
              : Colors.white,
          ),
          SizedBox( height: 5.0 ),
          Text(categories[i].name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: (newsService.selectedCategory == categories[i].name)
                ? Colors.red
                : Colors.white
            ),
          ),
        ],
      ),
    );
  }
}
