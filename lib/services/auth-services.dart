// ignore: file_names
import 'package:deally/models/auth-model.dart';
import 'package:deally/models/user-model.dart';
import 'package:deally/utils/requette-by-dii.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  Future<String?> auth(String tel, String password) async {
    return postResponse(
        url: "/users/auth",
        body: {"password": password, "phone": tel}).then((value) async {
      if (value['status'] == 200) {
        await SharedPreferences.getInstance().then((prefs) {
          prefs.setString('token', value['body']['data']['token']);
          prefs.setString('role', value['body']['data']['user']['role']);
        });
        return "Connexion réussi";
      } else {
        return null;
      }
    });
  }

  Future<String?> add(AuthModel user) {
    print(user.toMap());
    return postResponse(url: "/users", body: user.toMap()).then((value) async {
      if (value['status'] == 200) {
        await SharedPreferences.getInstance().then((prefs) {
          prefs.setString('token', value['body']['data']['token']);
          prefs.setString('role', value['body']['data']['role']);
        });
        return "connecter";
      } else {
        return null;
      }
    });
  }

  Future<String> getCode(String phone) {
    return postResponse(
        url: "/users/validNumber",
        body: {"telSender": phone, "app": "dirver"}).then((value) async {
      if (value['status'] == 201) {
        return value['data'];
      } else {
        return "null";
      }
    });
  }

  Future<String> veirfCode(String code) {
    return postResponse(url: "/users/validCode", body: {
      "code": code,
    }).then((value) async {
      if (value['status'] == 200) {
        return 'Valid';
      } else {
        return "null";
      }
    });
  }

  Future<UserModel?> updateAvatar(Map<String, dynamic> json) async {
    return putResponse(url: '/users', body: json)
        .then((value) => UserModel.fromJson(value['data']['user']));
  }
}
