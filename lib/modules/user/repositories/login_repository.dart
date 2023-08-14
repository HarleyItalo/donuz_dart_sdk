import '../../common/common_module.dart';
import '../user_module.dart';

abstract class LoginRepository {
  Future<String?> getLoggedUserToken();
  Future<LoginModel?> makeLogin({
    required String appId,
    required String username,
    required String password,
    String? playerId,
  });
  Future<String?> rememberPassword({
    required String email,
    required String appId,
  });
  Future<bool> makeLogout();
}

class LoginRepositoryImpl extends LoginRepository {
  final HttpService httpService;
  final StorageService storageService;
  LoginRepositoryImpl(this.httpService, this.storageService);

  @override
  Future<String?> getLoggedUserToken() async {
    if (!await storageService.existsKey(loginTokenKey)) {
      return null;
    }
    return await storageService.getString(loginTokenKey);
  }

  @override
  Future<LoginModel?> makeLogin({
    required String appId,
    required String username,
    required String password,
    String? playerId,
  }) async {
    var data = <String, dynamic>{};
    data['login'] = username;
    data['player_id'] = playerId;
    data['senha'] = password;
    var json = await httpService.post(
      "clients/login",
      data,
      appId: appId,
    );
    var login = LoginModel.fromJson(json);
    if (login.status != 200) {
      return null;
    }
    storageService.setData(loginTokenKey, login.token, serialize: false);
    return login;
  }

  @override
  Future<String?> rememberPassword({
    required String email,
    required String appId,
  }) async {
    var body = <String, dynamic>{};
    body['email'] = email;
    var result =
        await httpService.post("clients/forgotPassword", body, appId: appId);
    var response = BaseResponseDonuzModel.fromJson(result);
    return response.mensagem;
  }

  @override
  Future<bool> makeLogout() async {
    return await storageService.clearAll();
  }
}
