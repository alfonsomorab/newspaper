import 'package:flutter/material.dart';
import 'package:newspaper/src/pages/tabs_page.dart';
import 'package:newspaper/src/theme/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newspaper',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      home: TabsPage(),
    );
  }
}
