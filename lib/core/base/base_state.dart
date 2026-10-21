import 'package:flutter/material.dart';
import 'package:news_c20_dokki/core/base/base_navigator.dart';
import 'package:news_c20_dokki/core/base/base_view_model.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> implements BaseNavigator{
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = createViewModel();
    viewModel.navigator = this;
  }

  @override
  void dispose(){
    viewModel.navigator = null;
    super.dispose();
  }

  VM createViewModel();
}
