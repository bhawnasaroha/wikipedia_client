import 'package:flutter/material.dart';
import '../networking/fetch_articles.dart';

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: MyTheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ArticleListingHeader(),
                const SizedBox(height: 20),
                if (ArticleModel.articles != null &&
                    ArticleModel.articles!.isNotEmpty)
                  const Expanded(
                    child: ArticleListing(),
                  )
                else
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
