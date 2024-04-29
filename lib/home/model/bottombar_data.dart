import 'package:flutter/material.dart';

class BottomBar {
  BottomBar({this.icon = Icons.menu, this.index = 0, this.name = "", this.isCenter = false});
  IconData icon;
  bool isCenter;
  String name;
  int index;

  static List<BottomBar> tabIconsList = <BottomBar>[
    BottomBar(
      icon: Icons.home,
      index: 0,
      name: "Home",
    ),
    BottomBar(
      icon: Icons.bar_chart,
      index: 1,
      name: "Portfolio",
    ),
    BottomBar(
      icon: Icons.menu,
      index: 4,
      name: "",
      isCenter: true,
    ),
    BottomBar(
      icon: Icons.trending_up,
      index: 2,
      name: "Price",
    ),
    BottomBar(
      icon: Icons.settings,
      index: 3,
      name: "Settings",
    ),
  ];
}
