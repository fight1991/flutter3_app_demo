import 'package:app_demo/pages/home/home_page.dart';
import 'package:app_demo/utils/navigator_utils.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPage createState() => _IndexPage();
}

// 在此页面可以进行
// 1. 获取系统权限
// 2. 初始化用户信息
// 3. 跳转页面
class _IndexPage extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('初始化页面'),
      ),
    );
  }

  // 初始化用户信息
  void initData() {
    // 假设没有登录则跳转到登录页面
    NavigatorUtils.pushPageByFade(
      context: context,
      // targPage: LoginPage(),
      targPage: HomePage(),
      isReplace: true,
    );
  }
}
