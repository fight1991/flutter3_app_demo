class User {
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

  User({
    this.sNo,
    this.sName,
    this.sSex,
    this.sBirth,
    this.sId,
    this.sNum,
    this.sEmail,
    this.isMarried,
    this.sAddress,
    this.xl,
    this.major,
    this.school,
    this.graduateDate,
    this.pNo,
    this.dNo,
    this.pName,
    this.dName,
  });

  User.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['s_no'] = sNo;
    data['s_name'] = sName;
    data['s_sex'] = sSex;
    data['s_birth'] = sBirth;
    data['s_id'] = sId;
    data['s_num'] = sNum;
    data['s_email'] = sEmail;
    data['is_married'] = isMarried;
    data['s_address'] = sAddress;
    data['xl'] = xl;
    data['major'] = major;
    data['school'] = school;
    data['graduate_date'] = graduateDate;
    data['p_no'] = pNo;
    data['d_no'] = dNo;
    data['p_name'] = pName;
    data['d_name'] = dName;
    return data;
  }
}
