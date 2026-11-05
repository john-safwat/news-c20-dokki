import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:news_c20_dokki/core/base/base_cubit.dart';
import 'package:news_c20_dokki/presentation/home/home_actions.dart';
import 'package:news_c20_dokki/presentation/home/home_state.dart';

import '../../domain/entity/news_category.dart';

@injectable
class HomeCubit
    extends BaseCubit<HomeState, HomeActions, HomeNavigationActions> {
  HomeCubit() : super(HomeState(null));

  @override
  Future<void> doAction(HomeActions action) async {
    switch (action) {
      case ChangeSelectedCategory():
        {
          _changeCategory(action.category);
        }
      case GoToHome():
        {
          _goToHome();
        }
    }
  }

  void _changeCategory(NewsCategory category) {
    emit(state.copyWith(selectedCategory: category));
  }

  void _goToHome() {
    emit(HomeState(null));
    emitUIAction(CloseDrawer());
  }
}
