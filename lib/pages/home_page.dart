import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wikipedia_client/networking/fetch_articles.dart';
import 'package:xml2json/xml2json.dart';

import '../widgets/article_listing.dart';
import '../widgets/article_listing_header.dart';
import '../models/article.dart';
import '../widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  fetchArticles() async {
    await FetchArticles.getArticles();
    // const String url =
    //     'https://en.wikipedia.org/w/api.php?action=featuredfeed&format=json&feed=featured';
    // final xml2json = Xml2Json();
    // http.Response response = await http.get(Uri.parse(url));
    // var xmlResponse = response.body;
    // xml2json.parse(xmlResponse);
    // var jsonArticles = xml2json.toParker();
    // var decodedArticlesData = await jsonDecode(jsonArticles);
    // var articlesData = await decodedArticlesData["rss"]["channel"]["item"];
    // // printWrapped(articlesData.toString());
    // ArticleModel.articles = List.from(articlesData.reversed)
    //     .map<Article>((item) => Article.fromMap(item))
    //     .toList();
    setState(() {});
  }

  // void printWrapped(String text) {
  //   final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  //   pattern.allMatches(text).forEach((match) => print(match.group(0)));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ArticleListingHeader(),
              SizedBox(height: 20),
              if (ArticleModel.articles != null &&
                  ArticleModel.articles!.isNotEmpty)
                Expanded(
                  child: ArticleListing(),
                )
              else
                Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
