import 'package:app_demo/bean/bean_user.dart';
import 'package:app_demo/models/user.dart';
import 'package:app_demo/net/fetch_methods.dart';
import 'package:app_demo/net/http_helper.dart';
import 'package:app_demo/net/response_data.dart';
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
  List listData = [];
  @override
  void initState() {
    getStaffList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('首页')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: listData.length,
          itemBuilder: (BuildContext context, int index) {
            var tempUser = listData[index];
            UserBean user = UserBean.fromJson(tempUser);
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage('lib/assets/images/defaultImg.png'),
              ),
              title: Text('${user.sName}'),
              subtitle: Text('${user.sNum}'),
              shape: Border(bottom: BorderSide(color: Colors.black12)),
            );
          },
        ),
      ),
    );
  }

  // 获取列表
  getStaffList() async {
    ResponseInfo responseInfo = await Fetch.post(
      url: HttpHelper.getStaffList,
    );
    if (responseInfo.success) {
      listData = responseInfo.data;
      if (mounted) {
        setState(() {});
      }
    }
  }
}
