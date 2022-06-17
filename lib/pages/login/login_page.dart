import 'dart:async';

import 'package:app_demo/pages/home/home_page.dart';
import 'package:app_demo/utils/log_utils.dart';
import 'package:app_demo/utils/navigator_utils.dart';
import 'package:app_demo/utils/toast_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String codeText = '获取验证码';
  int seconds = 11;
  Timer? _timer;
  //手机号输入框焦点控制
  final FocusNode _userNameFocusNode = FocusNode();
  // 验证码焦点控制
  final FocusNode _codeFocusNode = FocusNode();
  //手机号输入框控制器
  final TextEditingController _userNameEditController = TextEditingController();
  //验证码输入框控制器
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
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [buildFormContainer(), buildSubmitBtn()],
            ),
          ),
        ));
  }

  Widget buildFormContainer() {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 100, right: 20, bottom: 20),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Container(
            padding: EdgeInsets.only(top: 80, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                //手机号
                TextField(
                  controller: _userNameEditController,
                  focusNode: _userNameFocusNode,
                  decoration: InputDecoration(hintText: '手机号'),
                ),
                SizedBox(
                  height: 15,
                ),
                //手机号
                Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: _codeEditController,
                      focusNode: _codeFocusNode,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              LogUtils.e('获取验证码');
                              // 发送验证码成功后开启倒计时
                              if (_timer != null) {
                                return;
                              }
                              LogUtils.e('进来了额');

                              // 倒计时开始
                              startTimerDown();
                            },
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    codeText,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor),
                                  ),
                                ])),
                        hintText: '验证码',
                      ),
                    )),
                    // TextButton(onPressed: () {}, child: Text('获取验证码'))
                  ],
                )
              ],
            ),
          ),
          Positioned(
            top: -45,
            child: Image.asset(
              "assets/images/user_static_logo.png",
              width: 90,
              height: 90,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSubmitBtn() {
    return GestureDetector(
      onTap: () {
        if (textFieldValid()) {
          // 跳转到tab页面
          NavigatorUtils.pushPageByFade(
            context: context,
            targPage: HomePage(),
            isReplace: true,
          );
        }
      },
      child: Container(
        height: 40,
        margin: EdgeInsets.only(top: 50, left: 40, right: 40, bottom: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Theme.of(context).colorScheme.secondary),
        child: Text(
          '登录',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void startTimerDown() {
    String temp = '';
    int count = seconds;
    _timer = Timer.periodic(Duration(milliseconds: 1000), (t) {
      count--;

      if (count < 10 && count > 0) {
        temp = '0${count}s';
      } else {
        temp = '${count}s';
        if (count == -1) {
          t.cancel();
          _timer = null; //定时器内部触发销毁
          count = seconds;
          temp = '获取验证码';
        }
      }
      setState(() {
        codeText = temp;
      });
    });
  }

  bool textFieldValid() {
    String mobile = _userNameEditController.text;
    String code = _codeEditController.text;
    if (mobile.trim().isEmpty) {
      ToastUtils.showToast('手机号不能为空');
      return false;
    }
    if (code.trim().isEmpty) {
      ToastUtils.showToast('验证码不能为空');
      return false;
    }
    return true;
  }
}
