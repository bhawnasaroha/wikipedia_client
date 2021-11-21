import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;

import 'package:wikipedia_client/models/article.dart';
// import 'package:wikipedia_client/utils/arguments.dart';
import 'package:wikipedia_client/utils/url.dart';
// / import 'package:wikipedia_client/utils/arguments.dart';

import '../widgets/themes.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article';

  const ArticleDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    Article article = args as Article;
    // print(article);
    dom.Document htmlDocument = htmlparser.parse(article.description);
    String articleDescription = article.description;
    String br = "<br>";
    String imageUrlPrefix = "https://upload";
    String imageUrlPrefixToChange = "//upload";
    articleDescription = articleDescription.replaceAll("\\n", br);
    articleDescription = articleDescription.replaceAll("\\", "");
    articleDescription =
        articleDescription.replaceAll(imageUrlPrefixToChange, imageUrlPrefix);
    // print(articleDescription);

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
                          await launchURL(article.link);
                        },
                        child: Text("Full Article"),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(StadiumBorder()),
                        ),
                      ),
                      SizedBox(height: 20),
                      HtmlWidget(
                        articleDescription,
                        onTapUrl: (url) async {
                          print(url);
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
