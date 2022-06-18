import 'package:flutter/material.dart';
import 'index_page.dart';

class RootAPP extends StatefulWidget {
  const RootAPP({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RootAPPState();
}

class _RootAPPState extends State<RootAPP> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xfff5f5f5)),
      home: IndexPage(),
    );
  }
}
