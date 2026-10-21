import 'package:flutter/material.dart';
import 'package:news_c20_dokki/api/api_manger.dart';
import 'package:news_c20_dokki/core/base/base_view_model.dart';
import 'package:news_c20_dokki/models/articles_response.dart' hide Source;
import 'package:news_c20_dokki/models/news_category.dart';
import 'package:news_c20_dokki/models/sources_response.dart';

class NewsViewModel extends BaseViewModel {
  final NewsCategory category;

  NewsViewModel(this.category);

  final ApiManger apiManger = ApiManger();

  List<Source> sources = [];
  String? sourcesError;
  bool sourcesLoading = false;

  List<Article> articles = [];
  String? articlesError;
  bool articlesLoading = false;

  int selectedIndex = 0;

  void changeSelectedIndex(int index){
    selectedIndex = index;
    getArticles();
    notifyListeners();
  }

  Future<void> getSources() async {
    sourcesLoading = true;
    notifyListeners();
    try {
      sources = (await apiManger.getSources(category.categoryId)).sources??[];
      getArticles();
    } catch (e) {
      sourcesError = e.toString();
    }
    sourcesLoading = false;
    notifyListeners();
  }

  Future<void> getArticles() async {
    articlesLoading = true;
    notifyListeners();
    try {
      articles = (await apiManger.getArticles(sources[selectedIndex].id??"")).articles??[];
    } catch (e) {
      articlesError = e.toString();
    }
    articlesLoading = false;
    notifyListeners();

  }
}
