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
      child: Image.asset(
        'lib/assets/images/defaultImg.png',
        fit: BoxFit.fill,
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
    // 假设没有登录则跳转到登录页面

    if (Global.isLogin) {
      LogUtils.e('假按揭啊哈哈${Global.profile.token}');
      // 查询用户信息
      ResponseInfo responseInfo = await Fetch.post(
        url: HttpHelper.login,
        data: {'account': Global.profile.user?.sNo},
      );
      if (!mounted) return;
      if (responseInfo.success) {
        User user = User.fromJson(responseInfo.data);
        Provider.of<UserModel>(context, listen: false).user = user;
      } else {
        Navigator.of(context).pushReplacementNamed('/main');
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
