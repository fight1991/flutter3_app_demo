import 'package:app_demo/utils/log_utils.dart';
import 'package:app_demo/utils/navigator_utils.dart';
import 'package:app_demo/widgets/iconfont/iconfont.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
        child: ListView(
          children: [
            buildCouponBox(),
          ],
        ),
      ),
    );
  }

  Widget buildCouponBox() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      height: MediaQuery.of(context).size.width * (178 / 690),
      // width: MediaQuery.of(context).size.width,
      child: Swiper(
          itemCount: 3,
          // viewportFraction: 0.8,
          // scale: 0.9,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Image.asset(
                'lib/assets/images/banner1.png',
                fit: BoxFit.fill,
              ),
            );
          },
          pagination: SwiperPagination(alignment: Alignment.bottomCenter),
          onTap: (int index) {
            LogUtils.e('点击轮播图$index');
          }),
    );
  }
}
