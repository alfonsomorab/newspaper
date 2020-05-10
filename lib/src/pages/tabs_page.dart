import 'package:flutter/material.dart';
import 'package:newspaper/src/pages/tab1_page.dart';
import 'package:newspaper/src/pages/tab2_page.dart';
import 'package:newspaper/src/services/news_service.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: _Navigators(),
      ),
    );
  }
}

class _Navigators extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: ( page ) => navigationModel.currentPage = page,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          title: Text("For you")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.public),
          title: Text("Headlines")
        ),
      ],
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigationModel = Provider.of<_NavigationModel>(context);

    return PageView(
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      controller: navigationModel.pageController,
      children: <Widget>[
        Tab1Page(),
        Tab2Page(),
      ],
    );
  }
}


class _NavigationModel with ChangeNotifier {

  int _currentPage = 0;
  PageController _pageController = PageController();

  int get currentPage => this._currentPage;
  PageController get pageController => this._pageController;

  set currentPage( int value ){
    this._currentPage = value;
    this._pageController.animateToPage( value ,
      duration: Duration( milliseconds: 250 ),
      curve: Curves.fastOutSlowIn
    );
    notifyListeners();
  }
}