import 'package:app_demo/bean/bean_user.dart';
import 'package:flutter/material.dart';
import 'package:app_demo/net/fetch_methods.dart';
import 'package:app_demo/net/http_helper.dart';
import 'package:app_demo/net/response_data.dart';
import 'package:app_demo/widgets/list_form_item/list_form_item.dart';

/// @Author: Tiancong
/// @Date: 2021-12-02 18:06:40
/// @Description: 详情页面

class StaffDetail extends StatefulWidget {
  final String? sNo;
  const StaffDetail({Key? key, this.sNo}) : super(key: key);
  @override
  State<StaffDetail> createState() => _StaffDetailState();
}

class _StaffDetailState extends State<StaffDetail> {
  UserBean? userDetail;
  @override
  void initState() {
    getStaffDetail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          '员工信息详情',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.amber[800],
      ),
      body: Container(
        child: ListView(children: [
          ListFormItem(title: '姓名', trailing: userDetail?.sName ?? '-'),
          ListFormItem(title: '性别', trailing: userDetail?.sSex ?? '-'),
          ListFormItem(title: '联系方式', trailing: userDetail?.sNum ?? '-'),
          ListFormItem(title: '邮箱', trailing: userDetail?.sEmail ?? '-'),
          ListFormItem(title: '联系地址', trailing: userDetail?.sAddress ?? '-'),
          ListFormItem(title: '学历', trailing: userDetail?.xl ?? '-'),
          ListFormItem(title: '专业', trailing: userDetail?.major ?? '-'),
          ListFormItem(title: '毕业院校', trailing: userDetail?.school ?? '-'),
          ListFormItem(title: '职位', trailing: userDetail?.pName ?? '-'),
          ListFormItem(title: '所属部门', trailing: userDetail?.dName ?? '-'),
        ]),
      ),
    );
  }

  // 获取订单详情
  void getStaffDetail() async {
    ResponseInfo responseInfo =
        await Fetch.post(url: HttpHelper.getUserDetail, data: {
      'account': widget.sNo,
    });
    if (responseInfo.success) {
      userDetail = UserBean.fromJson(responseInfo.data);
      if (mounted) {
        setState(() {});
      }
    }
  }
}
