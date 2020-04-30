import 'package:equatable/equatable.dart';
import 'article.dart';
import 'package:meta/meta.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];
}

class LoadArticleInitialState extends ArticleState{}

class LoadArticleSuccess extends ArticleState {

  final List<Article> articles;

  const LoadArticleSuccess({@required this.articles});

  @override
  List<Object> get props => [articles];
}

class LoadArticleFailed extends ArticleState{}

class LoadArticleInProgress extends ArticleState{}
