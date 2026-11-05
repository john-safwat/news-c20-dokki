import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<S , A , NA> extends Cubit<S>{
  BaseCubit(super.initialState);
  Future<void> doAction(A action);

  final StreamController<NA> _navigationController = StreamController.broadcast();
  Stream<NA> get navigationStream => _navigationController.stream;

  void emitUIAction(NA action) => _navigationController.add(action);
}