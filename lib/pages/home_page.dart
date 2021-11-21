import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

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
    const String url =
        'https://en.wikipedia.org/w/api.php?action=featuredfeed&format=json&feed=featured';
    final xml2json = Xml2Json();
    http.Response response = await http.get(Uri.parse(url));
    var xmlResponse = response.body;
    xml2json.parse(xmlResponse);
    var jsonArticles = xml2json.toParker();
    var decodedArticlesData = await jsonDecode(jsonArticles);
    var articlesData = await decodedArticlesData["rss"]["channel"]["item"];
    ArticleModel.articles = List.from(articlesData)
        .map<Article>((item) => Article.fromMap(item))
        .toList();
    setState(() {});
  }

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
              if (ArticleModel.articles != null &&
                  ArticleModel.articles!.isNotEmpty)
                ArticleListing()
              else
                CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleListingHeader extends StatelessWidget {
  const ArticleListingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Wikipedia",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBluish),
        ),
        Text(
          "Featured Articles",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}

class ArticleListing extends StatelessWidget {
  const ArticleListing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: ArticleModel.articles!.length,
        itemBuilder: (context, index) {
          final article = ArticleModel.articles![index];
          return ArticleItem(
            article: article,
          );
        });
  }
}

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                article.title,
                style: TextStyle(
                  color: MyTheme.darkBluish,
                ),
              ),
              Text(
                article.description,
                style: TextStyle(
                  color: MyTheme.darkBluish,
                ),
              ),
              SizedBox(height: 20),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      child: Text("Read"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluish),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ))
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
