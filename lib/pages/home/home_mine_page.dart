import 'package:app_demo/pages/login/login_page.dart';
import 'package:app_demo/utils/log_utils.dart';
import 'package:app_demo/utils/navigator_utils.dart';
import 'package:app_demo/utils/toast_utils.dart';
import 'package:app_demo/widgets/iconfont/iconfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);
  @override
  State<MinePage> createState() => _MinePage();
}

class _MinePage extends State<MinePage> {
  final List<Map<String, dynamic>> _listData = [
    {
      'leadIcon': IconFont.icon_card_finance,
      'iconColor': Color(0xffffa44b),
      'label': '我的银行卡',
      'bottomBorder': true,
      'navigator': null,
      'gap': false
    },
    {
      'leadIcon': IconFont.icon_ticket,
      'iconColor': Color(0xff447fff),
      'label': '我的卡券',
      'bottomBorder': true,
      'navigator': null,
      'gap': true
    },
    {
      'leadIcon': IconFont.icon_order,
      'iconColor': Color(0xff447fff),
      'label': '订单管理',
      'bottomBorder': true,
      'navigator': null,
      'gap': false
    },
    {
      'leadIcon': IconFont.icon_info,
      'iconColor': Color(0xff0dd7be),
      'label': '我的消息',
      'bottomBorder': true,
      'navigator': null,
      'gap': false
    },
    {
      'leadIcon': IconFont.icon_send,
      'iconColor': Color(0xffffa44b),
      'label': '推送设置',
      'bottomBorder': true,
      'navigator': null,
      'gap': false
    },
    {
      'leadIcon': IconFont.icon_setting,
      'iconColor': Color(0xffffa44b),
      'label': '个人设置',
      'bottomBorder': false,
      'navigator': null,
      'gap': true
    },
    {
      'leadIcon': IconFont.icon_logout,
      'iconColor': Colors.red,
      'label': '退出登录',
      'bottomBorder': false,
      'navigator': 'logOut',
      'gap': false
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: ListView(
        children: [
          buildHeadUser(),
          buildListView(),
        ],
      ),
    );
  }

  // 用户状态
  Widget buildHeadUser() {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 裁剪成圆形
          ClipOval(
            child: Image.asset(
              'lib/assets/images/user_static_logo.png',
              height: 80,
              width: 80,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(width: 10),
          Expanded(child: buildStatusBox()),
        ],
      ),
    );
  }

  Widget buildStatusBox() {
    return Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Text(
          '陈世美',
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
      ],
    );
  }

  // listTilte列表
  Widget buildListView() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8),
      child: ListView.builder(
        shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
        physics: NeverScrollableScrollPhysics(), //禁止滚动
        itemCount: _listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(bottom: _listData[index]['gap'] ? 15 : 0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: _listData[index]['bottomBorder']
                      ? Color(0xfff5f5f5)
                      : Color(0xffffffff),
                ),
              ),
            ),
            child: ListTile(
              leading: Icon(
                _listData[index]['leadIcon'],
                color: _listData[index]['iconColor'],
              ),
              title: Text(_listData[index]['label']),
              trailing: Icon(IconFont.icon_arrow_right),
              onTap: () {
                listTitleOnTap(index);
              },
            ),
          );
        },
      ),
    );
  }

  // listTitle点击事件
  void listTitleOnTap(int index) {
    LogUtils.e('点击listTile');
    String _op = _listData[index]['navigator'];
    if (_op == 'logOut') {
      logOutBtn();
    } else {
      // 跳转到其它页面
    }
  }

  // 退出登录
  void logOutBtn() async {
    var flag = await showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('温馨提示'),
          content: Container(
            padding: EdgeInsets.all(12),
            child: Text('您确定要退出登录吗?'),
          ),
          actions: [
            // 左边按钮
            CupertinoDialogAction(
              child: Text(
                '取消',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            CupertinoDialogAction(
              child: Text('退出'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
    if (flag) {
      // 点击确定按钮
      LogUtils.e('确定退出');
      NavigatorUtils.pushPageByFade(
        context: context,
        targPage: LoginPage(),
        isReplace: true,
      );
      ToastUtils.showToast('退出成功!');
    }
  }
}
