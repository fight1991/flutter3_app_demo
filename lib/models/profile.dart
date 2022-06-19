import 'cache.dart';
import 'user.dart';

class Profile {
  User? user;
  String? token;
  Cache? cache;
  String? lastLogin;

  Profile({this.user, this.token, this.cache, this.lastLogin});

  Profile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    cache = json['cache'] != null ? Cache.fromJson(json['cache']) : null;
    lastLogin = json['lastLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    if (cache != null) {
      data['cache'] = cache!.toJson();
    }
    data['lastLogin'] = lastLogin;
    return data;
  }
}
