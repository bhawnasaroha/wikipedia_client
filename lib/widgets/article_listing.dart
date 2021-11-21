import 'package:flutter/material.dart';

import '../models/article.dart';
import './article_item.dart';

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
      },
    );
  }
}
