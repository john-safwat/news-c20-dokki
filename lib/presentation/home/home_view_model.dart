import 'package:news_c20_dokki/core/base/base_view_model.dart';
import 'package:news_c20_dokki/domain/entity/news_category.dart';
import 'package:news_c20_dokki/presentation/home/home_navigator.dart';

class HomeViewModel extends BaseViewModel<HomeNavigator> {
  NewsCategory? selectedCategory;

  void changeCategory(NewsCategory category) {
    selectedCategory = category;
    notifyListeners();
  }

  void goToHome() {
    selectedCategory = null;
    notifyListeners();
    navigator!.pop();
  }
}
