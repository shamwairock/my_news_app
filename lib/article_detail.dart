import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'article.dart';
import 'article_bloc.dart';
import 'article_state.dart';

class ArticleDetail extends StatefulWidget {

  ArticleDetail({Key key, this.article}) : super(key: key);

  final Article article;

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('detail'),
      ),
      body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Image.network(widget.article.urlToImage),
            Text(widget.article.content)
          ]
      ),
    );
  }
}