import 'package:flutter/material.dart';
import 'package:newspaper/src/services/news_service.dart';
import 'package:newspaper/src/widgets/list_news_widget.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    final newsServices = Provider.of<NewsService>(context);
    return Scaffold(
      body: ( newsServices.headlines.length > 0 )
      ? ListNewsWidget( newsServices.headlines )
      : Center( child: CircularProgressIndicator() ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
