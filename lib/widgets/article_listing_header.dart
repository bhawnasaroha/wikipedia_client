import 'package:flutter/material.dart';

import '../widgets/themes.dart';

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
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: MyTheme.darkBluish),
        ),
        Text(
          "Featured Articles",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
