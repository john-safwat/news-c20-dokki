import 'package:flutter/material.dart';
import 'package:news_c20_dokki/domain/entity/article_entity.dart';
import 'package:news_c20_dokki/domain/entity/source_entity.dart';
import 'package:news_c20_dokki/presentation/home/tabs/news/news_actions.dart';

@immutable
class NewsState {
  final List<SourceEntity> sources;
  final String? sourcesError;
  final bool sourcesLoading;
  final List<ArticleEntity> articles;
  final String? articlesError;
  final bool articlesLoading;
  final int selectedIndex;

  const NewsState({
    this.sources = const [],
    this.sourcesError,
    this.sourcesLoading = false,
    this.articles = const [],
    this.articlesError,
    this.articlesLoading = false,
    this.selectedIndex = 0,
  });

  NewsState copyWith({
    List<SourceEntity>? sources,
    String? sourcesError,
    bool? sourcesLoading,
    List<ArticleEntity>? articles,
    String? articlesError,
    bool? articlesLoading,
    int? selectedIndex,
  }) {
    return NewsState(
      sources: sources ?? this.sources,
      sourcesError: sourcesError ?? this.sourcesError,
      sourcesLoading: sourcesLoading ?? this.sourcesLoading,
      articles: articles ?? this.articles,
      articlesError: articlesError ?? this.articlesError,
      articlesLoading: articlesLoading ?? this.articlesLoading,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
