import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../utils/routes.dart';
import '../utils/url.dart';
import '../utils/util_functions.dart';
import '../widgets/app_buttons.dart';

import '../models/article.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = article.description.indexOf('<p');
    String articleDescription =
        article.description.substring(index, index + 450) + '...';

    articleDescription = UtilFunctions.fixImageUrl(articleDescription);

    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                HtmlWidget(
                  articleDescription,
                  onTapUrl: (url) async {
                    await launchURL(article.link);
                    return true;
                  },
                  textStyle: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 10),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    AppButtons.primaryButton(
                      buttonText: "Read more",
                      onPressed: () async {
                        await Navigator.pushNamed(
                          context,
                          MyRoutes.articleDetail,
                          arguments: article,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
