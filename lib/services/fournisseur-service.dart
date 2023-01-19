import 'package:deally/models/user-model.dart';
import 'package:deally/models/whole-saler-model.dart';
import 'package:deally/utils/requette-by-dii.dart';

class FournisseurService {
  Future<UserModel?> getUser() async {
    return await getResponse(url: '/users').then((value) {
      return UserModel.fromJson(value['data']['user']);
    });
  }

  Future<bool?> addGrossite() async {
    return true;
  }

  Future<UserModel?> updateUser(UserModel user) async {
    print(user.toJson());
    return await putResponse(url: '/users', body: user.toJson()).then((value) {
      print(value);
      return UserModel.fromJson(value['body']['data']['user']);
    });
  }

  Future<WholeSaler?> addWholeSaler(WholeSaler wholeSaler) async {
    print(wholeSaler.toJson());
    return await postResponse(
            url: '/users/add-grossite', body: wholeSaler.toJson())
        .then((value) => WholeSaler.fromJson(value['body']['data']));
  }

  Future<List<WholeSaler>> getWholeSaler() async {
    return await getResponse(url: '/users/grossites').then((value) {
      return WholeSaler.fromList(value['data']);
    });
  }
}
