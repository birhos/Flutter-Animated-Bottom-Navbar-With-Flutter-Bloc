import 'dart:async';

import 'package:bloc/bloc.dart';

enum BottomNavigationItems {
  RedPage,
  GreenPage,
  BluePage,
}

class BottomNavigationBloc
    extends Bloc<BottomNavigationItems, BottomNavigationItems> {
  BottomNavigationBloc() : super(BottomNavigationItems.RedPage);

  @override
  Stream<BottomNavigationItems> mapEventToState(
      BottomNavigationItems event) async* {
    yield event;
  }
}
