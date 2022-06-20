import 'dart:io';

import 'package:app_demo/common/global.dart';
import 'package:app_demo/pages/root_app_page.dart';
import 'package:app_demo/providers/user_model.dart';
import 'package:app_demo/utils/loading_utils.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LoadingUtils.config();
  Global.init().then(
    (e) {
      runApp(
        MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (ctx) => UserModel()),
          ],
          child: RootAPP(),
        ),
      );
    },
  );
  // if (Platform.isAndroid) {
  //   // 设置状态栏背景及颜色
  //   SystemUiOverlayStyle systemUiOverlayStyle =
  //       SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  //   SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  //   // SystemChrome.setEnabledSystemUIOverlays([]); //隐藏状态栏
  // }
}
