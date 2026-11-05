import 'package:news_c20_dokki/domain/entity/news_category.dart';

sealed class HomeActions{}

class ChangeSelectedCategory extends HomeActions{
  final NewsCategory category;
  ChangeSelectedCategory(this.category);
}

class GoToHome extends HomeActions{}


sealed class HomeNavigationActions{}

class CloseDrawer extends HomeNavigationActions{}