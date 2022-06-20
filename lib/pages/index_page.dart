import 'package:app_demo/bean/bean_user.dart';
import 'package:app_demo/common/global.dart';
import 'package:app_demo/models/user.dart';
import 'package:app_demo/net/fetch_methods.dart';
import 'package:app_demo/net/http_helper.dart';
import 'package:app_demo/net/response_data.dart';
import 'package:app_demo/pages/home/home_page.dart';
import 'package:app_demo/pages/login/login_page.dart';
import 'package:app_demo/providers/user_model.dart';
import 'package:app_demo/utils/log_utils.dart';
import 'package:app_demo/utils/navigator_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPage();
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
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Image(
          width: 100,
          image: AssetImage(
            'assets/images/defaultImg.png',
          ),
        ),
      ),
    );
  }

  // 初始化用户信息
  void initData() async {
    // 假设没有登录则跳转到登录页面
    // NavigatorUtils.pushPageByFade(
    //   context: context,
    //   // targPage: LoginPage(),
    //   targPage: HomePage(),
    //   isReplace: true,
    // );
    if (Global.isLogin) {
      // 查询用户信息
      ResponseInfo responseInfo = await Fetch.post(
        url: HttpHelper.getUserDetail,
        data: {'account': Global.profile.token},
      );
      if (!mounted) return;
      if (responseInfo.success) {
        User user = User.fromJson(responseInfo.data);
        Provider.of<UserModel>(context, listen: false).user = user;
        Navigator.of(context).pushReplacementNamed('/main');
      } else {
        jumpToPage(LoginPage());
      }
      return;
    }
    jumpToPage(LoginPage());
  }

  // 跳转登录页面
  void jumpToPage(Widget page) {
    NavigatorUtils.pushPageByFade(
      context: context,
      targPage: page,
      isReplace: true,
    );
  }
}
