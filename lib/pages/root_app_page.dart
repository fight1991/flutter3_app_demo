import 'package:app_demo/routes/router_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'index_page.dart';

class RootAPP extends StatefulWidget {
  const RootAPP({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootAPPState();
}

class _RootAPPState extends State<RootAPP> {
  Color? themeColor = Colors.amber[800];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: themeColor),
        scaffoldBackgroundColor: Color(0xfff5f5f5),
        accentColor: themeColor,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: themeColor,
          ),
        ),
      ),
      routes: routeMap,
      home: IndexPage(),
      builder: EasyLoading.init(),
    );
  }
}
