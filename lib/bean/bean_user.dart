class UserBean {
  String? sNo;
  String? sName;
  String? sSex;
  String? sBirth;
  String? sId;
  String? sNum;
  String? sEmail;
  String? isMarried;
  String? sAddress;
  String? xl;
  String? major;
  String? school;
  String? graduateDate;
  String? pNo;
  String? dNo;
  String? pName;
  String? dName;

  UserBean.fromJson(Map<String, dynamic> json) {
    sNo = json['s_no'];
    sName = json['s_name'];
    sSex = json['s_sex'];
    sBirth = json['s_birth'];
    sId = json['s_id'];
    sNum = json['s_num'];
    sEmail = json['s_email'];
    isMarried = json['is_married'];
    sAddress = json['s_address'];
    xl = json['xl'];
    major = json['major'];
    school = json['school'];
    graduateDate = json['graduate_date'];
    pNo = json['p_no'];
    dNo = json['d_no'];
    pName = json['p_name'];
    dName = json['d_name'];
  }
}
