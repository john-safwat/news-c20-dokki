import 'package:flutter/material.dart';
import 'package:news_c20_dokki/domain/entity/news_category.dart';

@immutable
class HomeState{
  final NewsCategory? selectedCategory;
  const HomeState(this.selectedCategory);

  HomeState copyWith({
    NewsCategory? selectedCategory,
  }){
    return HomeState(
      selectedCategory ?? this.selectedCategory,
    );
  }
}