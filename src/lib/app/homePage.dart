import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:example/app/redPage.dart';
import 'package:example/app/bluePage.dart';
import 'package:example/app/greenPage.dart';
import 'package:example/blocs/bottomNavigationBloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BottomNavigationBloc _navbarBloc;

  @override
  void initState() {
    super.initState();
    _navbarBloc = BlocProvider.of<BottomNavigationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _navbarBloc,
      // ignore: missing_return
      builder: (BuildContext context, BottomNavigationItems state) {
        return Scaffold(
          body: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            reverseDuration: const Duration(milliseconds: 350),
            switchOutCurve: Curves.easeOutExpo,
            switchInCurve: Curves.easeInExpo,
            transitionBuilder: (Widget child, Animation<double> animation) {
              final Animation<double> inAnimation = Tween<double>(
                begin: 0.90,
                end: 1.0,
              ).animate(animation);

              return FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  child: child,
                  scale: inAnimation,
                ),
              );
            },
            child: buildChild(state),
          ),
          bottomNavigationBar: BottomNavigationBar(
            fixedColor: Colors.amber,
            currentIndex: childIndex(state),
            onTap: (index) {
              if (index == 0) {
                _navbarBloc.add(BottomNavigationItems.RedPage);
              } else if (index == 1) {
                _navbarBloc.add(BottomNavigationItems.BluePage);
              } else if (index == 2) {
                _navbarBloc.add(BottomNavigationItems.GreenPage);
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_one),
                title: Text("Red"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_two),
                title: Text("Blue"),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.looks_3),
                title: Text("Green"),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildChild(BottomNavigationItems state) {
    if (state == BottomNavigationItems.RedPage) {
      return RedPage();
    } else if (state == BottomNavigationItems.BluePage) {
      return BluePage();
    } else if (state == BottomNavigationItems.GreenPage) {
      return GreenPage();
    }

    return Container();
  }

  int childIndex(BottomNavigationItems state) {
    if (state == BottomNavigationItems.RedPage) {
      return 0;
    } else if (state == BottomNavigationItems.BluePage) {
      return 1;
    } else if (state == BottomNavigationItems.GreenPage) {
      return 2;
    }

    return 0;
  }
}
