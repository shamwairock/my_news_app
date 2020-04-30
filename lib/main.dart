import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/article.dart';
import 'package:mynewsapp/article_event.dart';

import 'article_bloc.dart';
import 'article_detail.dart';
import 'article_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider(
        create: (context) => ArticleBloc()..add(LoadArticle()),
        child: MyHomePage(title:'News'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<ArticleBloc, ArticleState>(
        builder: (context, state) {
          if(state is LoadArticleInProgress){
            return Center(
                child: CircularProgressIndicator()
            );
          }
          if(state is LoadArticleFailed){
            return Center(
              child: Text('No news is good news.'),
            );
          }
          if(state is LoadArticleSuccess){
            return _articleListView(state.articles);
          }
          return Container();
        }
      )
    );
  }

  ListView _articleListView(List<Article> articles) {
    return ListView.builder(
        shrinkWrap:true,
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                onTap: () => _loadArticleDetail(articles[index]),
                title: Text(articles[index].title, style: TextStyle(fontWeight: FontWeight.w600),),
                subtitle: Text(articles[index].description, style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),),
              ),
            ),
          );
        }
    );
  }

  void _loadArticleDetail(Article article) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) =>
              ArticleDetail(article: article),
        ));
  }
}

