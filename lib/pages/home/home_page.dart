import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_main_page.dart';
import 'home_mine_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: PageView(
          controller: _pageController,
          // 不可左右滑动
          physics: NeverScrollableScrollPhysics(),
          children: [MainPage(), MinePage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int value) {
          setState(() {
            _currentIndex = value;
            _pageController.jumpToPage(value);
          });
        },
        // 显示文字
        type: BottomNavigationBarType.fixed,
        // 选中的颜色
        selectedItemColor: Theme.of(context).accentColor,
        // 未选中的颜色
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的'),
        ],
      ),
    );
  }
}
