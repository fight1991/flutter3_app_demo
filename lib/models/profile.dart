import 'cache.dart';
import 'user.dart';

class Profile {
  User? user;
  String? token;
  Cache? cache;
  String? lastLogin;

  Profile({this.user, this.token, this.cache, this.lastLogin});

  Profile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
    cache = json['cache'] != null ? new Cache.fromJson(json['cache']) : null;
    lastLogin = json['lastLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    if (this.cache != null) {
      data['cache'] = this.cache!.toJson();
    }
    data['lastLogin'] = this.lastLogin;
    return data;
  }
}
