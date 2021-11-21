import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:html/dom.dart' as dom;
import 'package:flutter_html/flutter_html.dart';
import 'package:wikipedia_client/utils/arguments.dart';
// import 'package:wikipedia_client/utils/arguments.dart';
import 'package:wikipedia_client/utils/routes.dart';
import 'package:wikipedia_client/utils/url.dart';
import 'package:wikipedia_client/utils/util_functions.dart';
// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../models/article.dart';
import '../widgets/themes.dart';

class ArticleItem extends StatelessWidget {
  final Article article;
  const ArticleItem({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // dom.Document htmlDocument = htmlparser.parse(article.description);
    int index = article.description.indexOf('<p');
    String articleDescription =
        article.description.substring(index, index + 450) + '...';

    articleDescription = UtilFunctions.fixImageUrl(articleDescription);

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
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
                  style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold,
                    // color: MyTheme.darkBluish,
                  ),
                ),
                // Html.fromDom(document: htmlDocument),
                // Html(data: article.description),
                // HtmlWidget(article.description),
                HtmlWidget(
                  articleDescription,
                  onTapUrl: (url) async {
                    print(url);
                    await launchURL(article.link);
                    return true;
                  },
                  textStyle: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        await Navigator.pushNamed(
                          context,
                          MyRoutes.articleDetail,
                          arguments: article,
                        );
                      },
                      child: Text("Read"),
                      style: ButtonStyle(
                        // backgroundColor: MaterialStateProperty.all(
                        //   MyTheme.darkBluish,
                        // ),
                        shape: MaterialStateProperty.all(StadiumBorder()),
                      ),
                    )
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
