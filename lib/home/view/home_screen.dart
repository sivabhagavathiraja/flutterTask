import 'package:flutter/material.dart';
import 'package:flutter_task/app_theme.dart';
import 'package:flutter_task/home/model/bottombar_data.dart';
import 'package:flutter_task/home/widgets/header_bar.dart';
import 'package:flutter_task/home/widgets/item_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [HeaderBar(theme: theme), const Spacer()],
          ),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.32,
              child: SizedBox(width: MediaQuery.sizeOf(context).width, child: Center(child: ItemCard(theme: theme))))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {},
        items: BottomBar.tabIconsList
            .map((tab) => tab.isCenter
                ? _getCenterBottomBar(tab)
                : BottomNavigationBarItem(
                    icon: Icon(
                      tab.icon,
                      color: tab == BottomBar.tabIconsList[0] ? AppTheme.primary : AppTheme.black,
                    ),
                    label: tab.name,
                  ))
            .toList(),
      ),
    );
  }

  BottomNavigationBarItem _getCenterBottomBar(BottomBar data) {
    return BottomNavigationBarItem(
      label: "",
      icon: Container(
        decoration: const BoxDecoration(
          color: AppTheme.primary,
          shape: BoxShape.circle,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.white.withOpacity(0.1),
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(
                data.icon,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
