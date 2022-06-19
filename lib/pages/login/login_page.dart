import 'dart:async';

import 'package:app_demo/bean/bean_user.dart';
import 'package:app_demo/common/global.dart';
import 'package:app_demo/models/user.dart';
import 'package:app_demo/net/fetch_methods.dart';
import 'package:app_demo/net/http_helper.dart';
import 'package:app_demo/net/response_data.dart';
import 'package:app_demo/pages/home/home_page.dart';
import 'package:app_demo/providers/user_model.dart';
import 'package:app_demo/utils/log_utils.dart';
import 'package:app_demo/utils/navigator_utils.dart';
import 'package:app_demo/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String codeText = '获取验证码';
  int seconds = 11;
  Timer? _timer;
  //手机号输入框焦点控制
  final FocusNode _userNameFocusNode = FocusNode();
  // 验证码焦点控制
  final FocusNode _codeFocusNode = FocusNode();
  final TextEditingController _userNameEditController = TextEditingController();
  final TextEditingController _codeEditController = TextEditingController();
  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('登录'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 80, left: 30, right: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildFormContainer(),
                buildSubmitBtn(),
              ],
            ),
          ),
        ));
  }

  Widget buildFormContainer() {
    return Column(
      children: [
        TextField(
          controller: _userNameEditController,
          focusNode: _userNameFocusNode,
          decoration: InputDecoration(
            labelText: "账户",
            hintText: "您的账户",
            prefixIcon: Icon(Icons.person),
          ),
        ),
        SizedBox(height: 15),
        TextField(
          controller: _codeEditController,
          focusNode: _codeFocusNode,
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "您的登录密码",
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
      ],
    );
  }

  Widget buildSubmitBtn() {
    return GestureDetector(
      onTap: () {
        if (textFieldValid()) {
          String username = _userNameEditController.text;
          String pw = _codeEditController.text;
          if (textFieldValid()) {
            loginApi(username, pw);
          }
          // 跳转到tab页面
          // NavigatorUtils.pushPageByFade(
          //   context: context,
          //   targPage: HomePage(),
          //   isReplace: true,
          // );
        }
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).accentColor),
        child: Text(
          '登录',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  // 登录api
  loginApi(String account, String password) async {
    ResponseInfo responseInfo = await Fetch.post(
      url: HttpHelper.login,
      data: {account, password},
    );
    if (responseInfo.success) {
      UserBean useInfo = UserBean.fromJson(responseInfo.data);
      // 持久化token
      Global.profile.token = useInfo.sNo;
      Global.saveProfile();
      // 获取用户信息
      getUserInfo(useInfo.sNo);
    }
  }

  getUserInfo(String? account) async {
    if (account == null) return;
    ResponseInfo responseInfo = await Fetch.post(
      url: HttpHelper.getUserDetail,
      data: {account},
    );
    if (responseInfo.success) {
      User useInfo = User.fromJson(responseInfo.data);
      if (mounted) {
        Provider.of<UserModel>(context, listen: false).user = useInfo;
      }
    }
  }

  bool textFieldValid() {
    String mobile = _userNameEditController.text;
    String code = _codeEditController.text;
    if (mobile.trim().isEmpty) {
      ToastUtils.showToast('账号不能为空');
      return false;
    }
    if (code.trim().isEmpty) {
      ToastUtils.showToast('密码不能为空');
      return false;
    }
    return true;
  }
}
