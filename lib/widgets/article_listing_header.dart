import 'package:flutter/material.dart';

class ArticleListingHeader extends StatelessWidget {
  const ArticleListingHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Wikipedia",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "Featured Articles",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
