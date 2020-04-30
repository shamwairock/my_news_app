import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'article.dart';

abstract class ArticleEvent extends Equatable{
  const ArticleEvent();

  @override
  List<Object> get props => [];
}

class LoadArticle extends ArticleEvent{}
