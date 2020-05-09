import 'package:flutter/material.dart';
import 'package:newspaper/src/pages/tabs_page.dart';
import 'package:newspaper/src/services/news_service.dart';
import 'package:newspaper/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new NewsService() ),
      ],
      child: MaterialApp(
        title: 'Newspaper',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: TabsPage(),
      ),
    );
  }
}
