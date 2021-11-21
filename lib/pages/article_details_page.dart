import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import 'package:wikipedia_client/models/article.dart';
import 'package:wikipedia_client/utils/url.dart';
import 'package:wikipedia_client/utils/util_functions.dart';

import '../widgets/themes.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article';

  const ArticleDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    Article article = args as Article;

    String articleDescription = UtilFunctions.fixImageUrl(article.description);

    int indexOfFull = articleDescription.indexOf('Full');
    String fullArticleUrl = article.link;
    if (indexOfFull > 0) {
      String descriptionFullUrlSearchSet =
          articleDescription.substring(0, indexOfFull);
      int indexOfHref = descriptionFullUrlSearchSet.lastIndexOf('href');
      String fullArticleUrlSearchSet = descriptionFullUrlSearchSet.substring(
          indexOfHref, descriptionFullUrlSearchSet.length);
      fullArticleUrl = "https://en.wikipedia.org" +
          fullArticleUrlSearchSet.substring(
            fullArticleUrlSearchSet.indexOf('"') + 1,
            fullArticleUrlSearchSet.indexOf(
              '"',
              fullArticleUrlSearchSet.indexOf('"') + 1,
            ),
          );
    }
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () async {
                          await launchURL(fullArticleUrl);
                        },
                        child: Text("Full article"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                      ),
                      SizedBox(height: 20),
                      HtmlWidget(
                        articleDescription,
                        onTapUrl: (url) async {
                          await launchURL(article.link);
                          return true;
                        },
                        textStyle: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
