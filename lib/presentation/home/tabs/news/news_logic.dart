import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c20_dokki/core/base/base_cubit.dart';
import 'package:news_c20_dokki/domain/entity/news_category.dart';
import 'package:news_c20_dokki/domain/use_case/get_articles_use_case.dart';
import 'package:news_c20_dokki/domain/use_case/get_sources_use_case.dart';
import 'package:news_c20_dokki/presentation/home/tabs/news/news_actions.dart';
import 'package:news_c20_dokki/presentation/home/tabs/news/news_state.dart';

@injectable
class NewsCubit extends BaseCubit<NewsState, NewsActions, Object> {
  GetSourcesUseCase getSourcesUseCase;
  GetArticlesUseCase getArticlesUseCase;

  NewsCubit(this.getSourcesUseCase, this.getArticlesUseCase)
    : super(NewsState());

  @override
  Future<void> doAction(NewsActions action) async {
    switch (action) {
      case ChangeIndexNewsAction():
        {
          _changeSelectedIndex(action.index);
        }
      case LoadSourcesNewsAction():
        {
          _getSources(action.category);
        }
    }
  }

  Future<void> _getSources(NewsCategory category) async {
    emit(state.copyWith(sourcesLoading: true));
    try {
      var sources = (await getSourcesUseCase.execute(category.categoryId));
      emit(state.copyWith(sourcesLoading: false, sources: sources));
      _getArticles();
    } catch (e) {
      emit(state.copyWith(sourcesLoading: false, sourcesError: e.toString()));
    }
  }

  Future<void> _getArticles() async {
    emit(state.copyWith(articlesLoading: true));
    try {
      var articles = (await getArticlesUseCase.execute(
        state.sources[state.selectedIndex].id,
      ));
      emit(state.copyWith(articlesLoading: false, articles: articles));
    } catch (e) {
      emit(state.copyWith(articlesLoading: false, articlesError: e.toString()));
    }
  }

  void _changeSelectedIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
    _getArticles();
  }
}
