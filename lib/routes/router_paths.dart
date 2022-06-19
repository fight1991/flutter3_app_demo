import 'package:app_demo/pages/home/home_page.dart';
import 'package:app_demo/pages/index_page.dart';
import 'package:app_demo/pages/login/login_page.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> routeMap = {
  '/index': (ctx) => IndexPage(),
  '/login': (ctx) => LoginPage(),
  '/main': (ctx) => HomePage()
};
