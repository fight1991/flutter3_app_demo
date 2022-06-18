import 'package:app_demo/utils/log_utils.dart';
import 'package:app_demo/utils/navigator_utils.dart';
import 'package:app_demo/widgets/iconfont/iconfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('首页')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage('lib/assets/images/defaultImg.png'),
              ),
              title: Text('你好'),
              subtitle: Text('$index'),
              shape: Border(bottom: BorderSide(color: Colors.black12)),
            );
          },
        ),
      ),
    );
  }
}
