import 'package:flutter/material.dart';

import '../models/article.dart';
import '../widgets/themes.dart';

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
