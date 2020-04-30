import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynewsapp/article_event.dart';
import 'package:mynewsapp/article_state.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'article.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState>{
  @override
  ArticleState get initialState => LoadArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async*{

    if(event is LoadArticle){
      try{

        yield LoadArticleInProgress();

        final response = await http.get(
          'https://newsapi.org/v2/top-headlines?country=sg',
          headers: {HttpHeaders.authorizationHeader: "70c4a9b4c75e45819ed88bbe149e0854"},
        );
        final responseJson = json.decode(response.body);

        print(responseJson['status']);
        print(responseJson['totalResults']);

        var articles = new List<Article>();
        for(var article in responseJson['articles']){
          articles.add(Article.fromJson(article));
        }

        yield LoadArticleSuccess(articles: articles);
      }
      catch(error){
        yield LoadArticleFailed();
        print(error);
      }
    }
  }

}