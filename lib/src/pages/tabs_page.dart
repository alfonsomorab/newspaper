import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _Pages(),
      bottomNavigationBar: _Navigators(),
    );
  }
}

class _Navigators extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
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
    return PageView(
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}


class _NavigationController with ChangeNotifier {

  String _currentPage;

  get currentPage => this._currentPage;

  set currentPage( String value ){
    this._currentPage = value;

    notifyListeners();
  }
}