import 'package:flutter/material.dart';

import 'pages/article_details_page.dart';
import 'pages/home_page.dart';
import 'utils/routes.dart';
import 'widgets/themes.dart';

void main() {
  runApp(WikipediaClient());
}

class WikipediaClient extends StatelessWidget {
  const WikipediaClient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme,
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/": (BuildContext context) => const HomePage(),
        MyRoutes.homeRoute: (BuildContext context) => const HomePage(),
        MyRoutes.articleDetail: (BuildContext context) =>
            const ArticleDetailPage(),
      },
    );
  }
}
