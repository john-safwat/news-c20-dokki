import 'package:news_c20_dokki/domain/entity/news_category.dart';

sealed class NewsActions{}

class ChangeIndexNewsAction extends NewsActions{
  final int index;
  ChangeIndexNewsAction(this.index);
}

class LoadSourcesNewsAction extends NewsActions{
  final NewsCategory category;
  LoadSourcesNewsAction(this.category);
}
