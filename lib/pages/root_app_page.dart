import 'package:flutter/material.dart';
import 'index_page.dart';

class RootAPP extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RootAPPState();
}

class _RootAPPState extends State<RootAPP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xFFf5f9fc)),
      home: IndexPage(),
    );
  }
}
