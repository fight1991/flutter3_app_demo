class User {
  String? userName;
  String? userId;
  String? mobile;
  String? orgName;
  int? orgId;
  String? uid;

  User(
      {this.userName,
      this.userId,
      this.mobile,
      this.orgName,
      this.orgId,
      this.uid});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userId = json['userId'];
    mobile = json['mobile'];
    orgName = json['orgName'];
    orgId = json['orgId'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['userId'] = this.userId;
    data['mobile'] = this.mobile;
    data['orgName'] = this.orgName;
    data['orgId'] = this.orgId;
    data['uid'] = this.uid;
    return data;
  }
}
