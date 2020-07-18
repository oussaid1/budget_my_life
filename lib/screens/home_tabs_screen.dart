import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../widgets/app_drawer.dart';
import './graphs_screen.dart';
import './history_screen.dart';
import '../widgets/history_screen_fab.dart';

// Need this because the built-in FloatingActionButton widget isn't being used. A custom one is for the animation.

class HomeTabsScreen extends StatefulWidget {
  @override
  _HomeTabsScreenState createState() => _HomeTabsScreenState();
}

class _HomeTabsScreenState extends State<HomeTabsScreen> {
  int _pageIndex = 0;

  final List<Widget> _pageList = <Widget>[
    HistoryScreen(),
    GraphsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget My Life'),
      ),
      drawer: AppDrawer(),
      body: PageTransitionSwitcher(
        transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
          return FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: _pageList[_pageIndex],
      ),
      floatingActionButton: AnimatedOpacity(
        opacity: _pageIndex == 0 ? 1 : 0,
        duration: const Duration(milliseconds: 150),
        child: HistoryScreenFAB(tappable: _pageIndex == 0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (newPageIndex) {
          setState(() {
            _pageIndex = newPageIndex;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Graphs'),
          ),
        ],
      ),
    );
  }
}
