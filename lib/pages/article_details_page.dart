import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../models/article.dart';
import '../utils/url.dart';
import '../utils/util_functions.dart';
import '../widgets/app_buttons.dart';

import '../widgets/themes.dart';

class ArticleDetailPage extends StatelessWidget {
  static const routeName = '/article';

  const ArticleDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    Article article = args as Article;
    String articleDescription = UtilFunctions.fixImageUrl(article.description);
    String fullArticleUrl =
        UtilFunctions.findFullArticleLink(article.description, article.link);

    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.title,
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      AppButtons.primaryButton(
                        buttonText: "Full article",
                        onPressed: () async {
                          await launchURL(fullArticleUrl);
                        },
                      ),
                      HtmlWidget(
                        articleDescription,
                        onTapUrl: (url) async {
                          await launchURL(article.link);
                          return true;
                        },
                        textStyle: const TextStyle(fontSize: 18),
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
